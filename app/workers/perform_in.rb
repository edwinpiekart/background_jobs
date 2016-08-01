class PerformIn
  attr_reader :job_id

  def initialize(options)
    @options = options
    @queue = options.fetch(:queue, FileQueue)
    @interval = options.fetch(:time, Time.now)
  end

  def perform(command, *args)
    time = Time.now + @interval
    @job_id = @queue.schedule_job(command, *args, @options.merge({ time: time }))
  end
end
