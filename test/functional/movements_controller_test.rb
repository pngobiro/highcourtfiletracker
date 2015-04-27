require 'test_helper'

class MovementsControllerTest < ActionController::TestCase
  setup do
    @casefile = casefiles(:one)
    @movement = movements(:one)
  end

  test "should get index" do
    get :index, :casefile_id => @casefile
    assert_response :success
    assert_not_nil assigns(:movements)
  end

  test "should get new" do
    get :new, :casefile_id => @casefile
    assert_response :success
  end

  test "should create movement" do
    assert_difference('Movement.count') do
      post :create, :casefile_id => @casefile, :movement => @movement.attributes
    end

    assert_redirected_to casefile_movement_path(@casefile, assigns(:movement))
  end

  test "should show movement" do
    get :show, :casefile_id => @casefile, :id => @movement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :casefile_id => @casefile, :id => @movement.to_param
    assert_response :success
  end

  test "should update movement" do
    put :update, :casefile_id => @casefile, :id => @movement.to_param, :movement => @movement.attributes
    assert_redirected_to casefile_movement_path(@casefile, assigns(:movement))
  end

  test "should destroy movement" do
    assert_difference('Movement.count', -1) do
      delete :destroy, :casefile_id => @casefile, :id => @movement.to_param
    end

    assert_redirected_to casefile_movements_path(@casefile)
  end
end
