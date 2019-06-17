class Instructor < ApplicationRecord
  has_many :trainings
  has_many :clients, through: :trainings

  scope :instructor, -> (name) { where(instructor_name: name) }

  validates :name, presence: true
end
