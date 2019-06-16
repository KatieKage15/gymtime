class Training < ApplicationRecord
  belongs_to :client
  belongs_to :instructor

  validates :name, presence: true

  def request_training 
    "Thanks for requesting a training session with #{self.instructor.name}! They will see you at #{self.instructor.gym} soon!"
  end
end
