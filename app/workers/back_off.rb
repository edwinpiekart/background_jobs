class BackOff
  def initialize(options)
    @options = options
    @queue = options.fetch(:queue, FileQueue)
  end

  def perform(command, *args)
    backoff = 20 + @options.fetch(:count, 0)
    time = Time.now + backoff.seconds
    @queue.schedule_job(command, *args, @options.merge({ time: time }))
  end
end
