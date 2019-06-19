class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings
  has_secure_password
  validates_presence_of :username, :email
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :username, case_sensitive: false 

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |client|
      client.email = auth.info.email
      client.uid = auth.uid
      client.provider = auth.provider
      client.username = auth.info.name
      client.oauth_token = auth.credentials.token
      client.password_digest = "password"
      client.name = user.username
      client.save!
    end
  end
end
