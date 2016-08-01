class PerformWithRetry
  DEFAULT_RETRIES = 5

  def initialize(options)
    @options = options
    @retries = options.fetch(:retries, DEFAULT_RETRIES)
    @count = DEFAULT_RETRIES - @retries
  end


  def perform(command, *args)
    exceptions = args[0].exceptions_clases
    command.perform(*args)
  rescue *exceptions => e
    if @retries > 0
      Rails.logger.info("Retrying..., error: #{e}, command: #{command}, args: #{args}")

      new_options = @options.merge({ retries: @retries - 1, count: @count + 1 })
      BackOff.new(new_options).perform(command, *args)
    else
      Rails.logger.error("Out of retries!, error: #{e}, command: #{command}, #{args}: #{args}")
    end
  end
end
