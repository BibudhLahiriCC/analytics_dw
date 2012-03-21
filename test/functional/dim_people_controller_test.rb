require 'test_helper'

class DimPeopleControllerTest < ActionController::TestCase
  setup do
    @dim_person = dim_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dim_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dim_person" do
    assert_difference('DimPerson.count') do
      post :create, :dim_person => @dim_person.attributes
    end

    assert_redirected_to dim_person_path(assigns(:dim_person))
  end

  test "should show dim_person" do
    get :show, :id => @dim_person.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dim_person.to_param
    assert_response :success
  end

  test "should update dim_person" do
    put :update, :id => @dim_person.to_param, :dim_person => @dim_person.attributes
    assert_redirected_to dim_person_path(assigns(:dim_person))
  end

  test "should destroy dim_person" do
    assert_difference('DimPerson.count', -1) do
      delete :destroy, :id => @dim_person.to_param
    end

    assert_redirected_to dim_people_path
  end
end
