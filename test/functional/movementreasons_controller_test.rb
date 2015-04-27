require 'test_helper'

class MovementreasonsControllerTest < ActionController::TestCase
  setup do
    @movementreason = movementreasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movementreasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movementreason" do
    assert_difference('Movementreason.count') do
      post :create, movementreason: { reason: @movementreason.reason }
    end

    assert_redirected_to movementreason_path(assigns(:movementreason))
  end

  test "should show movementreason" do
    get :show, id: @movementreason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movementreason
    assert_response :success
  end

  test "should update movementreason" do
    put :update, id: @movementreason, movementreason: { reason: @movementreason.reason }
    assert_redirected_to movementreason_path(assigns(:movementreason))
  end

  test "should destroy movementreason" do
    assert_difference('Movementreason.count', -1) do
      delete :destroy, id: @movementreason
    end

    assert_redirected_to movementreasons_path
  end
end
