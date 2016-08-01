class BackJobSaver

  def self.perform(back_job)
    new(back_job).perform
  end

  def initialize(back_job)
    @back_job = back_job
  end

  def perform
    # raise NotImplementedError.new('not implemented error')
    # raise NameError.new('name error')
    # raise 'ony other error'

    params = JSON.parse(@back_job.json_params)
    uri = URI(@back_job.uri_str)

    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)

    if response.is_a?(Net::HTTPSuccess)
      @back_job.update_attribute(:response_body, response.body)
    end
    true
  end

end
