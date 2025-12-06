require "test_helper"

class HomecontrolControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get homecontrol_home_url
    assert_response :success
  end
end
