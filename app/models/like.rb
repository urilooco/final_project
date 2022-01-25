class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :image_id }
  
  belongs_to :user
  belongs_to :image
end
