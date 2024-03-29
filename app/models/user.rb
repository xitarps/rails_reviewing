class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posts
  has_many :comments

  mount_uploader :image, UserImageUploader
end
