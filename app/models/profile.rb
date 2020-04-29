class Profile < ApplicationRecord
  belongs_to :user
  # the dependent destroy thing here
end
