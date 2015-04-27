require 'test_helper'

class HearingcalenderControllerTest < ActionController::TestCase
  test "should get todayhearings" do
    get :todayhearings
    assert_response :success
  end

  test "should get thisweekhearings" do
    get :thisweekhearings
    assert_response :success
  end

  test "should get thismonthhearings" do
    get :thismonthhearings
    assert_response :success
  end

end
