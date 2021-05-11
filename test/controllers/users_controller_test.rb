require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get koszyk" do
    get users_koszyk_url
    assert_response :success
  end
end
