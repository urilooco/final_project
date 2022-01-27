class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  
  has_one_attached :avatar

  has_many :images
  has_many :likes
  has_many :save_images

  def to_param
    username
  end
end
