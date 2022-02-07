require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  # setup do
  #   @image = images(:one)
  # end

  # test "should get index" do
  #   get images_path
  #   assert_response :success
  # end

  test "should sign in first" do
    get new_image_path
    assert_response :found
  end
end
