class Company < ActiveRecord::Base
  attr_accessible :name, :phone

  has_one :address, as: :addressable
  has_many :jobs
  has_many :employees

end
