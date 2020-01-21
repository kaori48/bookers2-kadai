class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, length: {minimum: 2, maximum: 20}, presence: true
  validates :introduction, length: {maximum: 50}
  has_many :books, dependent: :destroy
end