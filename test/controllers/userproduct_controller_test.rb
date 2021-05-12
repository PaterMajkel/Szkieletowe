require "test_helper"

class UserproductControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get userproduct_create_url
    assert_response :success
  end

  test "should get delete" do
    get userproduct_delete_url
    assert_response :success
  end
end
