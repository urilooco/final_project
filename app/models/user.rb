class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /[a-zA-Z0-9\.]+/
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
  validates_length_of :username, in: 6..20

  validates :name, presence: true
  validates_format_of :name, with: /[a-zA-Z]+/
  validates_length_of :name, in: 8..35
  
  has_one_attached :avatar

  has_many :images
  has_many :likes
  has_many :save_images

  scope :by_username, ->(username) { where("username LIKE ?", "%#{username}%") }

  def to_param
    username
  end
end
