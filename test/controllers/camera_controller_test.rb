require "test_helper"

class CameraControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get camera_new_url
    assert_response :success
  end
end
