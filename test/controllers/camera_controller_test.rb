require "test_helper"

class CameraControllerTest < ActionDispatch::IntegrationTest
  test "redirected if not logged in" do
    get new_camera_path
    assert_response :redirect
  end

  test "can get camera path" do
    sign_in users(:user_001)
    get new_camera_path
    assert_response :success
  end
end
