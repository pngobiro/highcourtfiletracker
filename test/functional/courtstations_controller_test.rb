require 'test_helper'

class CourtstationsControllerTest < ActionController::TestCase
  setup do
    @courtstation = courtstations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courtstations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create courtstation" do
    assert_difference('Courtstation.count') do
      post :create, courtstation: { name: @courtstation.name, typeofcourt: @courtstation.typeofcourt }
    end

    assert_redirected_to courtstation_path(assigns(:courtstation))
  end

  test "should show courtstation" do
    get :show, id: @courtstation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @courtstation
    assert_response :success
  end

  test "should update courtstation" do
    put :update, id: @courtstation, courtstation: { name: @courtstation.name, typeofcourt: @courtstation.typeofcourt }
    assert_redirected_to courtstation_path(assigns(:courtstation))
  end

  test "should destroy courtstation" do
    assert_difference('Courtstation.count', -1) do
      delete :destroy, id: @courtstation
    end

    assert_redirected_to courtstations_path
  end
end
