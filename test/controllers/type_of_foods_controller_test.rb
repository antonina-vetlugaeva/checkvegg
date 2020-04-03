require 'test_helper'

class TypeOfFoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ = s(:one)
  end

  test "should get index" do
    get s_url
    assert_response :success
  end

  test "should get new" do
    get new__url
    assert_response :success
  end

  test "should create " do
    assert_difference('TypeOfFood.count') do
      post s_url, params: { : { name: @.name } }
    end

    assert_redirected_to _url(TypeOfFood.last)
  end

  test "should show " do
    get _url(@)
    assert_response :success
  end

  test "should get edit" do
    get edit__url(@)
    assert_response :success
  end

  test "should update " do
    patch _url(@), params: { : { name: @.name } }
    assert_redirected_to _url(@)
  end

  test "should destroy " do
    assert_difference('TypeOfFood.count', -1) do
      delete _url(@)
    end

    assert_redirected_to s_url
  end
end
