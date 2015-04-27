require 'test_helper'

class CaseoutcomesControllerTest < ActionController::TestCase
  setup do
    @caseoutcome = caseoutcomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:caseoutcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create caseoutcome" do
    assert_difference('Caseoutcome.count') do
      post :create, caseoutcome: { outcome: @caseoutcome.outcome }
    end

    assert_redirected_to caseoutcome_path(assigns(:caseoutcome))
  end

  test "should show caseoutcome" do
    get :show, id: @caseoutcome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @caseoutcome
    assert_response :success
  end

  test "should update caseoutcome" do
    put :update, id: @caseoutcome, caseoutcome: { outcome: @caseoutcome.outcome }
    assert_redirected_to caseoutcome_path(assigns(:caseoutcome))
  end

  test "should destroy caseoutcome" do
    assert_difference('Caseoutcome.count', -1) do
      delete :destroy, id: @caseoutcome
    end

    assert_redirected_to caseoutcomes_path
  end
end
