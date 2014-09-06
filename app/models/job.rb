class Job < ActiveRecord::Base
  attr_accessible :abroad, :cancelled, :description, :end_date, :filled, :latitude, :longitude, :start_date

  has_one :address, as: :addressable
  has_many :jobsearches
  belongs_to :company
  has_and_belongs_to_many :qualifications
end
