require "test_helper"

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id: 1, image_id: 1)
  end

  test 'valid like' do
    assert @like.valid?
  end
end
