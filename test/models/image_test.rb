require "test_helper"

class ImageTest < ActiveSupport::TestCase
  def setup
    @image = Image.new(user_id: 1, description: 'test image')
  end

  test 'valid post' do
    assert @image.valid?
  end

  test 'valid post without description' do
    @image.description = ''
    assert @image.valid?
  end

  test 'invalid without an user' do
    @image.user_id = nil
    assert_not @image.valid?
  end
end
