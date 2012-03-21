require 'test_helper'

class FctVisitsControllerTest < ActionController::TestCase
  setup do
    @fct_visit = fct_visits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fct_visits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fct_visit" do
    assert_difference('FctVisit.count') do
      post :create, :fct_visit => @fct_visit.attributes
    end

    assert_redirected_to fct_visit_path(assigns(:fct_visit))
  end

  test "should show fct_visit" do
    get :show, :id => @fct_visit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fct_visit.to_param
    assert_response :success
  end

  test "should update fct_visit" do
    put :update, :id => @fct_visit.to_param, :fct_visit => @fct_visit.attributes
    assert_redirected_to fct_visit_path(assigns(:fct_visit))
  end

  test "should destroy fct_visit" do
    assert_difference('FctVisit.count', -1) do
      delete :destroy, :id => @fct_visit.to_param
    end

    assert_redirected_to fct_visits_path
  end
end
