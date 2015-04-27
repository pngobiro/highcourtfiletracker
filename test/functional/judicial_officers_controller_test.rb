require 'test_helper'

class JudicialOfficersControllerTest < ActionController::TestCase
  setup do
    @judicial_officer = judicial_officers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:judicial_officers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create judicial_officer" do
    assert_difference('JudicialOfficer.count') do
      post :create, judicial_officer: { chambers: @judicial_officer.chambers, name: @judicial_officer.name, title: @judicial_officer.title }
    end

    assert_redirected_to judicial_officer_path(assigns(:judicial_officer))
  end

  test "should show judicial_officer" do
    get :show, id: @judicial_officer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @judicial_officer
    assert_response :success
  end

  test "should update judicial_officer" do
    put :update, id: @judicial_officer, judicial_officer: { chambers: @judicial_officer.chambers, name: @judicial_officer.name, title: @judicial_officer.title }
    assert_redirected_to judicial_officer_path(assigns(:judicial_officer))
  end

  test "should destroy judicial_officer" do
    assert_difference('JudicialOfficer.count', -1) do
      delete :destroy, id: @judicial_officer
    end

    assert_redirected_to judicial_officers_path
  end
end
