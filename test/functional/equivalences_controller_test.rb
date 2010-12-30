require 'test_helper'

class EquivalencesControllerTest < ActionController::TestCase
  setup do
    @equivalence = equivalences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equivalences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equivalence" do
    assert_difference('Equivalence.count') do
      post :create, :equivalence => @equivalence.attributes
    end

    assert_redirected_to equivalence_path(assigns(:equivalence))
  end

  test "should show equivalence" do
    get :show, :id => @equivalence.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @equivalence.to_param
    assert_response :success
  end

  test "should update equivalence" do
    put :update, :id => @equivalence.to_param, :equivalence => @equivalence.attributes
    assert_redirected_to equivalence_path(assigns(:equivalence))
  end

  test "should destroy equivalence" do
    assert_difference('Equivalence.count', -1) do
      delete :destroy, :id => @equivalence.to_param
    end

    assert_redirected_to equivalences_path
  end
end
