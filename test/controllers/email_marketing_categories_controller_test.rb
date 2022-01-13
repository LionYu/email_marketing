require "test_helper"

class EmailMarketingCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @email_marketing_category = email_marketing_categories(:one)
  end

  test "should get index" do
    get email_marketing_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_email_marketing_category_url
    assert_response :success
  end

  test "should create email_marketing_category" do
    assert_difference("EmailMarketingCategory.count") do
      post email_marketing_categories_url, params: { email_marketing_category: { name: @email_marketing_category.name } }
    end

    assert_redirected_to email_marketing_category_url(EmailMarketingCategory.last)
  end

  test "should show email_marketing_category" do
    get email_marketing_category_url(@email_marketing_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_email_marketing_category_url(@email_marketing_category)
    assert_response :success
  end

  test "should update email_marketing_category" do
    patch email_marketing_category_url(@email_marketing_category), params: { email_marketing_category: { name: @email_marketing_category.name } }
    assert_redirected_to email_marketing_category_url(@email_marketing_category)
  end

  test "should destroy email_marketing_category" do
    assert_difference("EmailMarketingCategory.count", -1) do
      delete email_marketing_category_url(@email_marketing_category)
    end

    assert_redirected_to email_marketing_categories_url
  end
end
