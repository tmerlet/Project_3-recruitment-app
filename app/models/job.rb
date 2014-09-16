class Job < ActiveRecord::Base
  attr_accessible :abroad, :cancelled, :description, :end_date, :filled, :latitude, :longitude, :start_date, :address_attributes, :company_id, :salary_range

  has_one :address, as: :addressable, dependent: :destroy
  validates_associated :address

  accepts_nested_attributes_for :address
  
  has_many :jobsearches
  belongs_to :company
  has_and_belongs_to_many :qualifications
end
