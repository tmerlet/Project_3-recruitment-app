class Address < ActiveRecord::Base
  attr_accessible :city, :country, :line1, :line2, :postcode, :addressable_id, :addressable_type, :current_latatitude, :current_longitude, :use_dynamic_location

  geocoded_by :postcode 

  after_validation :geocode

  # , if: ->(obj){ obj.postcode.present? and obj.postcode_changed? } 


  belongs_to :addressable, :polymorphic => true

  validates :line1, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

end
