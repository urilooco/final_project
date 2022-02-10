require "test_helper"

class SaveImagesControllerTest < ActionDispatch::IntegrationTest
  test "redirected if not logged in" do
    get save_images_url
    assert_response :redirect
  end

  test "can get camera path" do
    sign_in users(:user_001)
    get save_images_path
    assert_response :success
  end
end
