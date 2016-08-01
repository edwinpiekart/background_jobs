require 'test_helper'

class StartControllerTest < ActionController::TestCase

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get weather' do
    get :get_weather
    assert_redirected_to back_jobs_path
  end

  test 'should get_my_ip' do
    get :get_my_ip
    assert_redirected_to back_jobs_path
  end

  test 'should custom_jobs' do
    get :custom_jobs
    assert_response :success
  end

  test 'should get_custom_job' do
    get :get_custom_job, std_worker: 'WeatherLondonQuery', retries: 1, exceptions: ''
    assert_redirected_to back_jobs_path
  end

  test 'should fails get_custom_job' do
    get :get_custom_job
    assert_redirected_to start_index_path
  end

  test 'should create_batch' do
    get :create_batch
    assert_response :success
  end

  test 'should get_batch' do
    get :get_batch, cities: 'Warsaw,pl;Paris;fr'
    assert_redirected_to back_jobs_path
  end

end
