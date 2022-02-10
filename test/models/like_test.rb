require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.create(user_id: 1, image_id: 1)
  end

  test 'valid like' do
    assert @like.valid?
  end

  test 'invalid without user_id' do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test 'invalid without image_id' do
    @like.image_id = nil
    assert_not @like.valid?
  end
end
