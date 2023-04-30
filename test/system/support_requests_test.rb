require "application_system_test_case"

class SupportRequestsTest < ApplicationSystemTestCase
  test "should create Support Request" do
    visit new_support_request_path

    fill_in "name", with: "SM"
    fill_in "Email", with: "saul@saul.com"
    fill_in "Description", with: "This is an issue description"

    click_on "Create Support request"

    assert_text "Request created successfully"
  end

  test "should validate email" do
    visit new_support_request_path

    fill_in "name", with: "SM"
    fill_in "Email", with: "saul"
    fill_in "Description", with: "This is an issue description"

    click_on "Create Support request"

    assert_text "Must be a valid email address"
  end

  test "should validate name present" do
    visit new_support_request_path

    fill_in "Email", with: "saul@saul.com"
    fill_in "Description", with: "This is an issue description"

    click_on "Create Support request"

    assert_text "name is required"
  end

  test "should validate description present" do
    visit new_support_request_path

    fill_in "name", with: "SM"
    fill_in "Email", with: "saul@saul.com"

    click_on "Create Support request"

    assert_text "description is required"
  end



end
