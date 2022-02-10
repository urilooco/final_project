require "test_helper"

class ImageTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_001)
    @image = Image.new(user_id: @user.id, :image => fixture_file_upload('/files/image.jpeg', 'image/jpeg'), description: 'test image')
    post :change_avatar, params: { avatar: fixture_file_upload('david.png', 'image/png') }
  end

  test 'valid post' do
    assert @image.valid?
  end

  # test 'valid post without description' do
  #   @image.description = ''
  #   assert @image.valid?
  # end

  # test 'invalid without an user' do
  #   @image.user_id = nil
  #   assert_not @image.valid?
  # end
end
