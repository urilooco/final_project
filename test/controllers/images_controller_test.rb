require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get images_path
    assert_response :success
  end

  # test "should sign in first" do
  #   get 'images/new'
  #   assert_response :found
  # end

  # def test_index
  #   get images_path
  #   assert_equal Image.all
  # end
end
