require 'test_helper'

class CaseFilesControllerTest < ActionController::TestCase
  setup do
    @case_file = case_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:case_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create case_file" do
    assert_difference('CaseFile.count') do
      post :create, case_file: { CaseNumber: @case_file.CaseNumber, CaseParties: @case_file.CaseParties, CaseStatus: @case_file.CaseStatus, CourtStation: @case_file.CourtStation, DateLastinCourt: @case_file.DateLastinCourt, DateofFilling: @case_file.DateofFilling, DateofLastAction: @case_file.DateofLastAction, PrayersSought: @case_file.PrayersSought, Remarks: @case_file.Remarks, TypeofCase: @case_file.TypeofCase }
    end

    assert_redirected_to case_file_path(assigns(:case_file))
  end

  test "should show case_file" do
    get :show, id: @case_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @case_file
    assert_response :success
  end

  test "should update case_file" do
    put :update, id: @case_file, case_file: { CaseNumber: @case_file.CaseNumber, CaseParties: @case_file.CaseParties, CaseStatus: @case_file.CaseStatus, CourtStation: @case_file.CourtStation, DateLastinCourt: @case_file.DateLastinCourt, DateofFilling: @case_file.DateofFilling, DateofLastAction: @case_file.DateofLastAction, PrayersSought: @case_file.PrayersSought, Remarks: @case_file.Remarks, TypeofCase: @case_file.TypeofCase }
    assert_redirected_to case_file_path(assigns(:case_file))
  end

  test "should destroy case_file" do
    assert_difference('CaseFile.count', -1) do
      delete :destroy, id: @case_file
    end

    assert_redirected_to case_files_path
  end
end
