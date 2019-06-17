class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings
  has_secure_password
  validates_presence_of :username, :email
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(:username => auth_hash["username"]).first_or_create do |client|
      client.password = SecureRandom.hex
    end
  end
end
