class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => oauth_username).first_or_create do |client|
      client.password = SecureRandom.hex
    end
  end
end
