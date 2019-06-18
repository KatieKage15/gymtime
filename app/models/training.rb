class Training < ApplicationRecord
  belongs_to :client
  belongs_to :instructor

  validates :name, presence: true
end
