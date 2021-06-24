require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "index works without being logged in" do
    get root_path
    assert_response :success
  end
end
