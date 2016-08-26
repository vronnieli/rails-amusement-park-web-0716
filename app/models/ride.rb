class Ride < ActiveRecord::Base
  # validates :user_id, :attraction_id, presence: true
  belongs_to :user
  belongs_to :attraction
  # write associations here



  def take_ride
    # attraction = Attraction.find(params[:id])
    # user = User.find(session[:user_id])
    if self.user.tickets > self.attraction.tickets && self.user.height > self.attraction.min_height
      self.user.tickets-=self.attraction.tickets
      self.user.nausea+=self.attraction.nausea_rating
      self.user.happiness+=self.attraction.happiness_rating
      self.user.save
      "Thanks for riding the #{self.attraction.name}!"
    elsif self.user.tickets > self.attraction.tickets
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif self.user.height > self.attraction.min_height
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    else
      "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    end
  end

end
