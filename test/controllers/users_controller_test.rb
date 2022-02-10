require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_001)
  end

  test "should get profile" do
    get profile_path(@user.username)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:user_001)
    get edit_user_path(:user_001)
    # assert_template 'users/edit'
    assert_template partial: '_edit'
  end

  # test "should get profile edit" do
  #   get edit_profile_path
  #   assert_response :redirect
  # end
end
