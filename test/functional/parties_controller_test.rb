require 'test_helper'

class PartiesControllerTest < ActionController::TestCase
  setup do
    @casefile = casefiles(:one)
    @party = parties(:one)
  end

  test "should get index" do
    get :index, :casefile_id => @casefile
    assert_response :success
    assert_not_nil assigns(:parties)
  end

  test "should get new" do
    get :new, :casefile_id => @casefile
    assert_response :success
  end

  test "should create party" do
    assert_difference('Party.count') do
      post :create, :casefile_id => @casefile, :party => @party.attributes
    end

    assert_redirected_to casefile_party_path(@casefile, assigns(:party))
  end

  test "should show party" do
    get :show, :casefile_id => @casefile, :id => @party.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :casefile_id => @casefile, :id => @party.to_param
    assert_response :success
  end

  test "should update party" do
    put :update, :casefile_id => @casefile, :id => @party.to_param, :party => @party.attributes
    assert_redirected_to casefile_party_path(@casefile, assigns(:party))
  end

  test "should destroy party" do
    assert_difference('Party.count', -1) do
      delete :destroy, :casefile_id => @casefile, :id => @party.to_param
    end

    assert_redirected_to casefile_parties_path(@casefile)
  end
end
