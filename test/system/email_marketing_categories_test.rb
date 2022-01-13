require "application_system_test_case"

class EmailMarketingCategoriesTest < ApplicationSystemTestCase
  setup do
    @email_marketing_category = email_marketing_categories(:one)
  end

  test "visiting the index" do
    visit email_marketing_categories_url
    assert_selector "h1", text: "Email marketing categories"
  end

  test "should create email marketing category" do
    visit email_marketing_categories_url
    click_on "New email marketing category"

    fill_in "Name", with: @email_marketing_category.name
    click_on "Create Email marketing category"

    assert_text "Email marketing category was successfully created"
    click_on "Back"
  end

  test "should update Email marketing category" do
    visit email_marketing_category_url(@email_marketing_category)
    click_on "Edit this email marketing category", match: :first

    fill_in "Name", with: @email_marketing_category.name
    click_on "Update Email marketing category"

    assert_text "Email marketing category was successfully updated"
    click_on "Back"
  end

  test "should destroy Email marketing category" do
    visit email_marketing_category_url(@email_marketing_category)
    click_on "Destroy this email marketing category", match: :first

    assert_text "Email marketing category was successfully destroyed"
  end
end
