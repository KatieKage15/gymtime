class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings

  def self.find_or_create_by_omniauth(auth_hash)
    oauth_username = auth_hash[:username]
    if client = Client.find_by(:username => oauth_username)
      return client
    else
      client = Client.create(:username => oauth_username, :password => SecureRandom.hex)
    end
  end
end
