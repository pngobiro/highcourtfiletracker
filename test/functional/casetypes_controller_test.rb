require 'test_helper'

class CasetypesControllerTest < ActionController::TestCase
  setup do
    @casetype = casetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create casetype" do
    assert_difference('Casetype.count') do
      post :create, casetype: { division: @casetype.division, typeofcase: @casetype.typeofcase, typeofcourt: @casetype.typeofcourt }
    end

    assert_redirected_to casetype_path(assigns(:casetype))
  end

  test "should show casetype" do
    get :show, id: @casetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @casetype
    assert_response :success
  end

  test "should update casetype" do
    put :update, id: @casetype, casetype: { division: @casetype.division, typeofcase: @casetype.typeofcase, typeofcourt: @casetype.typeofcourt }
    assert_redirected_to casetype_path(assigns(:casetype))
  end

  test "should destroy casetype" do
    assert_difference('Casetype.count', -1) do
      delete :destroy, id: @casetype
    end

    assert_redirected_to casetypes_path
  end
end
