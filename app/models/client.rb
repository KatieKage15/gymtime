class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings
end
