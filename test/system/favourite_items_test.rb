require "application_system_test_case"

class FavouriteItemsTest < ApplicationSystemTestCase
  setup do
    @favourite_item = favourite_items(:one)
  end

  test "visiting the index" do
    visit favourite_items_url
    assert_selector "h1", text: "Favourite Items"
  end

  test "creating a Favourite item" do
    visit favourite_items_url
    click_on "New Favourite Item"

    fill_in "Favourite", with: @favourite_item.favourite_id
    fill_in "Product", with: @favourite_item.product_id
    fill_in "Product item", with: @favourite_item.product_item_id
    click_on "Create Favourite item"

    assert_text "Favourite item was successfully created"
    click_on "Back"
  end

  test "updating a Favourite item" do
    visit favourite_items_url
    click_on "Edit", match: :first

    fill_in "Favourite", with: @favourite_item.favourite_id
    fill_in "Product", with: @favourite_item.product_id
    fill_in "Product item", with: @favourite_item.product_item_id
    click_on "Update Favourite item"

    assert_text "Favourite item was successfully updated"
    click_on "Back"
  end

  test "destroying a Favourite item" do
    visit favourite_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favourite item was successfully destroyed"
  end
end
