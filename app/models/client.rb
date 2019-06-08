class Client < ApplicationRecord
  has_many :classes
  has_many :instructors, through: :classes
end
