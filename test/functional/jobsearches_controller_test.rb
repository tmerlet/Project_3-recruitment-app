require 'test_helper'

class JobsearchesControllerTest < ActionController::TestCase
  setup do
    @jobsearch = jobsearches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jobsearches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jobsearch" do
    assert_difference('Jobsearch.count') do
      post :create, jobsearch: { contacted: @jobsearch.contacted, dateaccepted: @jobsearch.dateaccepted, datecontacted: @jobsearch.datecontacted, datedeclined: @jobsearch.datedeclined, dateoffered: @jobsearch.dateoffered, daterejected: @jobsearch.daterejected, declined: @jobsearch.declined, firstsearchposition: @jobsearch.firstsearchposition, job_id: @jobsearch.job_id, offered: @jobsearch.offered, rejected: @jobsearch.rejected, user_id: @jobsearch.user_id }
    end

    assert_redirected_to jobsearch_path(assigns(:jobsearch))
  end

  test "should show jobsearch" do
    get :show, id: @jobsearch
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jobsearch
    assert_response :success
  end

  test "should update jobsearch" do
    put :update, id: @jobsearch, jobsearch: { contacted: @jobsearch.contacted, dateaccepted: @jobsearch.dateaccepted, datecontacted: @jobsearch.datecontacted, datedeclined: @jobsearch.datedeclined, dateoffered: @jobsearch.dateoffered, daterejected: @jobsearch.daterejected, declined: @jobsearch.declined, firstsearchposition: @jobsearch.firstsearchposition, job_id: @jobsearch.job_id, offered: @jobsearch.offered, rejected: @jobsearch.rejected, user_id: @jobsearch.user_id }
    assert_redirected_to jobsearch_path(assigns(:jobsearch))
  end

  test "should destroy jobsearch" do
    assert_difference('Jobsearch.count', -1) do
      delete :destroy, id: @jobsearch
    end

    assert_redirected_to jobsearches_path
  end
end
