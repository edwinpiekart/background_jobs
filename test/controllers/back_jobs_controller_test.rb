require 'test_helper'

class BackJobsControllerTest < ActionController::TestCase
  setup do
    @back_job = back_jobs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:back_jobs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create back_job" do
    assert_difference('BackJob.count') do
      post :create, back_job: {uri_str: 'MyString',
                               json_params: '{}',
                               response_body: '',
                               retries: 0,
                               exceptions: ''}
    end

    assert_redirected_to back_job_path(assigns(:back_job))
  end

  test "should show back_job" do
    get :show, id: @back_job
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @back_job
    assert_response :success
  end

  test "should update back_job" do
    patch :update, id: @back_job, back_job: {uri_str: 'MyString',
                                             json_params: '{}',
                                             response_body: '',
                                             retries: 0,
                                             exceptions: ''}
    assert_redirected_to back_job_path(assigns(:back_job))
  end

  test "should destroy back_job" do
    assert_difference('BackJob.count', -1) do
      delete :destroy, id: @back_job
    end

    assert_redirected_to back_jobs_path
  end
end
