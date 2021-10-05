class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :books
  validates_uniqueness_of :name
  validates_length_of :name, in: 2..20
  validates_length_of :introduction, maximum: 50 
end