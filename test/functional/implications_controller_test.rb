require 'test_helper'

class ImplicationsControllerTest < ActionController::TestCase
  setup do
    @implication = implications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:implications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create implication" do
    assert_difference('Implication.count') do
      post :create, :implication => @implication.attributes
    end

    assert_redirected_to implication_path(assigns(:implication))
  end

  test "should show implication" do
    get :show, :id => @implication.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @implication.to_param
    assert_response :success
  end

  test "should update implication" do
    put :update, :id => @implication.to_param, :implication => @implication.attributes
    assert_redirected_to implication_path(assigns(:implication))
  end

  test "should destroy implication" do
    assert_difference('Implication.count', -1) do
      delete :destroy, :id => @implication.to_param
    end

    assert_redirected_to implications_path
  end
end
