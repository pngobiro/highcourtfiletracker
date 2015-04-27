require 'test_helper'

class AdjournmentreasonsControllerTest < ActionController::TestCase
  setup do
    @adjournmentreason = adjournmentreasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adjournmentreasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adjournmentreason" do
    assert_difference('Adjournmentreason.count') do
      post :create, adjournmentreason: { reason: @adjournmentreason.reason }
    end

    assert_redirected_to adjournmentreason_path(assigns(:adjournmentreason))
  end

  test "should show adjournmentreason" do
    get :show, id: @adjournmentreason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adjournmentreason
    assert_response :success
  end

  test "should update adjournmentreason" do
    put :update, id: @adjournmentreason, adjournmentreason: { reason: @adjournmentreason.reason }
    assert_redirected_to adjournmentreason_path(assigns(:adjournmentreason))
  end

  test "should destroy adjournmentreason" do
    assert_difference('Adjournmentreason.count', -1) do
      delete :destroy, id: @adjournmentreason
    end

    assert_redirected_to adjournmentreasons_path
  end
end
