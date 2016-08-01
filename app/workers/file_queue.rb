class FileQueue
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  sidekiq_options retry: false

  def self.schedule_job(command, back_job_id, options)
    time = options.fetch(:time, Time.now)
    perform_at(time, command, back_job_id, options)
  end

  def perform(command_name, back_job_id, options)
    back_job = BackJob.find(back_job_id)

    options = options.reduce({}) { |m, (k, v)| m[k.to_sym] = v; m }
    PerformWithRetry.new(options).perform(command_name.constantize, back_job)
  end

end
