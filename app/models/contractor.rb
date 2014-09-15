class Contractor < User
  attr_accessible :abroad, :available_now, :distance_travel, :dob, :latitude, :longitude, :address_attributes, :qualifications
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :jobsearches
  has_and_belongs_to_many :qualifications
  # accepts_nested_attributes_for :qualifications

end
