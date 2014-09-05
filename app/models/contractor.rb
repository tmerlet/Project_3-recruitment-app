class Contractor < User
  attr_accessible :abroad, :availability_now, :distance_travel, :dob, :latitude, :longitude
  has_one :address
  has_many :jobsearches

end
