class Address < ActiveRecord::Base
  attr_accessible :city, :country, :line1, :line2, :postcode, :addressable_id, :addressable_type

  belongs_to :addressable, :polymorphic => true

  validates :line1, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

end
