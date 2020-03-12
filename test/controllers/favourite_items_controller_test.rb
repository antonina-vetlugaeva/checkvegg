require 'test_helper'

class FavouriteItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourite_item = favourite_items(:one)
  end

  test "should get index" do
    get favourite_items_url
    assert_response :success
  end

  test "should get new" do
    get new_favourite_item_url
    assert_response :success
  end

  test "should create favourite_item" do
    assert_difference('FavouriteItem.count') do
      post favourite_items_url, params: { favourite_item: { favourite_id: @favourite_item.favourite_id, product_id: @favourite_item.product_id, product_item_id: @favourite_item.product_item_id } }
    end

    assert_redirected_to favourite_item_url(FavouriteItem.last)
  end

  test "should show favourite_item" do
    get favourite_item_url(@favourite_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_favourite_item_url(@favourite_item)
    assert_response :success
  end

  test "should update favourite_item" do
    patch favourite_item_url(@favourite_item), params: { favourite_item: { favourite_id: @favourite_item.favourite_id, product_id: @favourite_item.product_id, product_item_id: @favourite_item.product_item_id } }
    assert_redirected_to favourite_item_url(@favourite_item)
  end

  test "should destroy favourite_item" do
    assert_difference('FavouriteItem.count', -1) do
      delete favourite_item_url(@favourite_item)
    end

    assert_redirected_to favourite_items_url
  end
end
