class Qualification < ActiveRecord::Base
  attr_accessible :industry, :name, :subdivision

  has_and_belongs_to_many :contractors
  has_and_belongs_to_many :jobs
end
