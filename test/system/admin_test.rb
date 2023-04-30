require "application_system_test_case"

class AdminTest < ApplicationSystemTestCase

  def login
    visit new_admin_user_session_path
    fill_in "Email", with: "admin@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    assert_text "Signed in successfully."
  end

  test "should list Support Requests" do
    SupportRequest.create!(name: "SM", email: "saul@saul.com", description: "This is a test")
    login
    assert_text "This is a test"
    click_on "Edit"

    click_on "Assign to me"
    assert_text "Assigned!"

    fill_in "Response", with: "This is a response"
    click_on "Update Support request"
    assert_text "Support request was successfully updated."

    assert_text "This is a response"
    assert_text "resolved"
  end
end
