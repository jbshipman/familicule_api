class User < ApplicationRecord
  # validations
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_uniqueness_of :email

  # model associations
  has_one :profile
  has_many :user_cules
  has_many :cules, through: :user_cules
end
