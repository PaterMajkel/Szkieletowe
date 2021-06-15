require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get unsubscribe" do
    get settings_unsubscribe_url
    assert_response :success
  end
end
