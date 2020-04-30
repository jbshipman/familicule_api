class Cule < ApplicationRecord
  # validations
  validates_uniqueness_of :name

  # associations of model
  has_many :user_cules
  has_many :users, through: :user_cules
end
