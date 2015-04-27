require 'test_helper'

class CasefilesControllerTest < ActionController::TestCase
  setup do
    @courtstation = courtstations(:one)
    @casefile = casefiles(:one)
  end

  test "should get index" do
    get :index, :courtstation_id => @courtstation
    assert_response :success
    assert_not_nil assigns(:casefiles)
  end

  test "should get new" do
    get :new, :courtstation_id => @courtstation
    assert_response :success
  end

  test "should create casefile" do
    assert_difference('Casefile.count') do
      post :create, :courtstation_id => @courtstation, :casefile => @casefile.attributes
    end

    assert_redirected_to courtstation_casefile_path(@courtstation, assigns(:casefile))
  end

  test "should show casefile" do
    get :show, :courtstation_id => @courtstation, :id => @casefile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :courtstation_id => @courtstation, :id => @casefile.to_param
    assert_response :success
  end

  test "should update casefile" do
    put :update, :courtstation_id => @courtstation, :id => @casefile.to_param, :casefile => @casefile.attributes
    assert_redirected_to courtstation_casefile_path(@courtstation, assigns(:casefile))
  end

  test "should destroy casefile" do
    assert_difference('Casefile.count', -1) do
      delete :destroy, :courtstation_id => @courtstation, :id => @casefile.to_param
    end

    assert_redirected_to courtstation_casefiles_path(@courtstation)
  end
end
