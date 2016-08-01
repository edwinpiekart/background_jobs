class StdWorkerCreator

  def initialize(query)
    @query = query
  end

  def create!
    bj = BackJob.new.tap do |back_job|
      back_job.uri_str = @query.uri_str
      back_job.json_params = @query.params_hash.to_json
      back_job.retries = @query.retries
      back_job.exceptions = @query.exceptions
    end
    bj.save!

    PerformIn.new({ time: 0, retries: bj.retries }).perform(BackJobSaver, bj.id)
  end

end
