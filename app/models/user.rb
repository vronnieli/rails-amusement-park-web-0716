class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  # validates :name, :nausea, :happiness, :tickets, :height, presence: true


  has_secure_password

  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? "sad" : "happy"
    end
  end

end
