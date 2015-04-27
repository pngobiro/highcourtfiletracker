require 'test_helper'

class FilelocationsControllerTest < ActionController::TestCase
  setup do
    @filelocation = filelocations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filelocations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filelocation" do
    assert_difference('Filelocation.count') do
      post :create, filelocation: { location: @filelocation.location }
    end

    assert_redirected_to filelocation_path(assigns(:filelocation))
  end

  test "should show filelocation" do
    get :show, id: @filelocation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filelocation
    assert_response :success
  end

  test "should update filelocation" do
    put :update, id: @filelocation, filelocation: { location: @filelocation.location }
    assert_redirected_to filelocation_path(assigns(:filelocation))
  end

  test "should destroy filelocation" do
    assert_difference('Filelocation.count', -1) do
      delete :destroy, id: @filelocation
    end

    assert_redirected_to filelocations_path
  end
end
