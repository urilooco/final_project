class Chat < ApplicationRecord
  # belongs_to :user

  has_many :messages
  has_and_belongs_to_many :users
end
