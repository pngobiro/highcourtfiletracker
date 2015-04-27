require 'test_helper'

class TrackersControllerTest < ActionController::TestCase
  setup do
    @casefile = casefiles(:one)
    @tracker = trackers(:one)
  end

  test "should get index" do
    get :index, :casefile_id => @casefile
    assert_response :success
    assert_not_nil assigns(:trackers)
  end

  test "should get new" do
    get :new, :casefile_id => @casefile
    assert_response :success
  end

  test "should create tracker" do
    assert_difference('Tracker.count') do
      post :create, :casefile_id => @casefile, :tracker => @tracker.attributes
    end

    assert_redirected_to casefile_tracker_path(@casefile, assigns(:tracker))
  end

  test "should show tracker" do
    get :show, :casefile_id => @casefile, :id => @tracker.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :casefile_id => @casefile, :id => @tracker.to_param
    assert_response :success
  end

  test "should update tracker" do
    put :update, :casefile_id => @casefile, :id => @tracker.to_param, :tracker => @tracker.attributes
    assert_redirected_to casefile_tracker_path(@casefile, assigns(:tracker))
  end

  test "should destroy tracker" do
    assert_difference('Tracker.count', -1) do
      delete :destroy, :casefile_id => @casefile, :id => @tracker.to_param
    end

    assert_redirected_to casefile_trackers_path(@casefile)
  end
end
