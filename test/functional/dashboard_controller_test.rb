require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get allcases" do
    get :allcases
    assert_response :success
  end

  test "should get pendingcases" do
    get :pendingcases
    assert_response :success
  end

  test "should get completedcases" do
    get :completedcases
    assert_response :success
  end

  test "should get transfaredcases" do
    get :transfaredcases
    assert_response :success
  end

  test "should get reports" do
    get :reports
    assert_response :success
  end

  test "should get searchcase" do
    get :searchcase
    assert_response :success
  end

  test "should get courtcalender" do
    get :courtcalender
    assert_response :success
  end

end
