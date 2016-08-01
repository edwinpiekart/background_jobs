class StartController < ApplicationController
  def index
  end

  def get_weather
    StdWorkerCreator.new(WeatherQuery.new).create!

    redirect_to back_jobs_path
  rescue
    redirect_on_exception
  end

  def get_my_ip
    StdWorkerCreator.new(MyIpQuery.new).create!

    redirect_to back_jobs_path
  rescue
    redirect_on_exception
  end

  def custom_jobs
  end

  def get_custom_job
    StdWorkerCreator.new(query).create!

    redirect_to back_jobs_path
  rescue
    redirect_on_exception
  end

  def create_batch
  end

  def get_batch
    BatchCitiesWorkerCreator.new(params[:cities].to_s).create!

    redirect_to back_jobs_path
  rescue
    redirect_on_exception
  end

  private

  def query
    params[:std_worker].to_s.constantize.new.tap do |q|
      q.retries = params[:retries].to_i
      q.exceptions = params[:exceptions]
    end
  end

  def redirect_on_exception
    flash[:error] = 'Something went wrong!'
    redirect_to start_index_path
  end

end
