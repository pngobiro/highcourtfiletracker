require 'test_helper'

class HearingsControllerTest < ActionController::TestCase
  setup do
    @casefile = casefiles(:one)
    @hearing = hearings(:one)
  end

  test "should get index" do
    get :index, :casefile_id => @casefile
    assert_response :success
    assert_not_nil assigns(:hearings)
  end

  test "should get new" do
    get :new, :casefile_id => @casefile
    assert_response :success
  end

  test "should create hearing" do
    assert_difference('Hearing.count') do
      post :create, :casefile_id => @casefile, :hearing => @hearing.attributes
    end

    assert_redirected_to casefile_hearing_path(@casefile, assigns(:hearing))
  end

  test "should show hearing" do
    get :show, :casefile_id => @casefile, :id => @hearing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :casefile_id => @casefile, :id => @hearing.to_param
    assert_response :success
  end

  test "should update hearing" do
    put :update, :casefile_id => @casefile, :id => @hearing.to_param, :hearing => @hearing.attributes
    assert_redirected_to casefile_hearing_path(@casefile, assigns(:hearing))
  end

  test "should destroy hearing" do
    assert_difference('Hearing.count', -1) do
      delete :destroy, :casefile_id => @casefile, :id => @hearing.to_param
    end

    assert_redirected_to casefile_hearings_path(@casefile)
  end
end
