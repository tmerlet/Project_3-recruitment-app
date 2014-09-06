class Address < ActiveRecord::Base
  attr_accessible :city, :country, :line1, :line2, :postcode

  belongs_to :addressable, :polymorphic => true
end
