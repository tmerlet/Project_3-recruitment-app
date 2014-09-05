class CreateContractors < ActiveRecord::Migration
  def change
    create_table :contractors do |t|
      t.float :longitude
      t.float :latitude
      t.date :dob
      t.integer :distance_travel
      t.boolean :abroad
      t.boolean :availability_now

      t.timestamps
    end
  end
end
