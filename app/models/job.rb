class Job < ActiveRecord::Base
  attr_accessible :abroad, :cancelled, :description, :end_date, :filled, :latitude, :longitude, :start_date
end
