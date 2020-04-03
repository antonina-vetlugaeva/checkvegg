require "application_system_test_case"

class TypeOfFoodsTest < ApplicationSystemTestCase
  setup do
    @ = s(:one)
  end

  test "visiting the index" do
    visit s_url
    assert_selector "h1", text: "Type Of Foods"
  end

  test "creating a Type of food" do
    visit s_url
    click_on "New Type Of Food"

    fill_in "Name", with: @.name
    click_on "Create Type of food"

    assert_text "Type of food was successfully created"
    click_on "Back"
  end

  test "updating a Type of food" do
    visit s_url
    click_on "Edit", match: :first

    fill_in "Name", with: @.name
    click_on "Update Type of food"

    assert_text "Type of food was successfully updated"
    click_on "Back"
  end

  test "destroying a Type of food" do
    visit s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type of food was successfully destroyed"
  end
end
