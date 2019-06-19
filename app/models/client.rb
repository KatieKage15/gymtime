class Client < ApplicationRecord
  has_many :trainings
  has_many :instructors, through: :trainings
  has_secure_password
  validates_presence_of :username, :email
  validates_format_of :email, with: /@/
  validates_uniqueness_of :email, case_sensitive: false
  validates_uniqueness_of :username, case_sensitive: false

  def self.find_or_create_by(auth_hash)
    self.where(:user_name => auth_hash["info"]["name"]).first_or_create do |client|
	  user.password= SecureRandom.hex
    end
  end
end
