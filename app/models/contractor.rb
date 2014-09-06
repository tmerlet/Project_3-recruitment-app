class Contractor < User
  attr_accessible :abroad, :availability_now, :distance_travel, :dob, :latitude, :longitude
  has_one :address, as: :addressable
  has_many :jobsearches
  has_and_belongs_to_many :qualifications

end
