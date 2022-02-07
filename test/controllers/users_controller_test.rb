require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_001)
  end

  test "should get profile" do
    get profile_path(@user.username)
    assert_response :success
  end

  # test "should get profile edit" do
  #   get edit_profile_path
  #   assert_response :redirect
  # end
end
