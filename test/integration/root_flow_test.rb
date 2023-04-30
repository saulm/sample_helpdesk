require "test_helper"

class RootFlowTest < ActionDispatch::IntegrationTest
    test "visiting the index, redirects to support_requests#new" do
    get "/"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Support Requests"
  end
end
