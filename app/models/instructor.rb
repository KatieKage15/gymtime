class Instructor < ApplicationRecord
  has_many :classes
  has_many :clients, through: :classes 
end
