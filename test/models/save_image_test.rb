require "test_helper"

class SaveImageTest < ActiveSupport::TestCase
  def setup
    @saved_image = SaveImage.create(user_id: 1, image_id: 1)
  end

  test 'valid saved_image' do
    assert @saved_image.valid?
  end

  test 'invalid without user_id' do
    @saved_image.user_id = nil
    assert_not @saved_image.valid?
  end

  test 'invalid without image_id' do
    @saved_image.image_id = nil
    assert_not @saved_image.valid?
  end
end
