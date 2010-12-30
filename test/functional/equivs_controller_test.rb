require 'test_helper'

class EquivsControllerTest < ActionController::TestCase
  setup do
    @equiv = equivs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equivs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equiv" do
    assert_difference('Equiv.count') do
      post :create, :equiv => @equiv.attributes
    end

    assert_redirected_to equiv_path(assigns(:equiv))
  end

  test "should show equiv" do
    get :show, :id => @equiv.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @equiv.to_param
    assert_response :success
  end

  test "should update equiv" do
    put :update, :id => @equiv.to_param, :equiv => @equiv.attributes
    assert_redirected_to equiv_path(assigns(:equiv))
  end

  test "should destroy equiv" do
    assert_difference('Equiv.count', -1) do
      delete :destroy, :id => @equiv.to_param
    end

    assert_redirected_to equivs_path
  end
end
