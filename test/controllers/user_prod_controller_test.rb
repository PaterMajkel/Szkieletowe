require "test_helper"

class UserProdControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_prod_index_url
    assert_response :success
  end

  test "should get create" do
    get user_prod_create_url
    assert_response :success
  end

  test "should get delete" do
    get user_prod_delete_url
    assert_response :success
  end
end
