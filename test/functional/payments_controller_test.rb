require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @casefile = casefiles(:one)
    @payment = payments(:one)
  end

  test "should get index" do
    get :index, :casefile_id => @casefile
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new, :casefile_id => @casefile
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, :casefile_id => @casefile, :payment => @payment.attributes
    end

    assert_redirected_to casefile_payment_path(@casefile, assigns(:payment))
  end

  test "should show payment" do
    get :show, :casefile_id => @casefile, :id => @payment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :casefile_id => @casefile, :id => @payment.to_param
    assert_response :success
  end

  test "should update payment" do
    put :update, :casefile_id => @casefile, :id => @payment.to_param, :payment => @payment.attributes
    assert_redirected_to casefile_payment_path(@casefile, assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, :casefile_id => @casefile, :id => @payment.to_param
    end

    assert_redirected_to casefile_payments_path(@casefile)
  end
end
