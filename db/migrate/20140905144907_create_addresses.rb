class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1, :null => false
      t.string :line2
      t.string :city, :null => false
      t.string :postcode, :null => false, :limit => 55
      t.string :country, :null => false

      # for the polymorphic association
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
