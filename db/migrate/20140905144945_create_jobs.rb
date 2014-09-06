class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.text :description
      t.boolean :abroad
      t.boolean :filled
      t.boolean :cancelled
      t.date :start_date
      t.date :end_date
      t.float :longitude
      t.float :latitude
      t.integer :company_id

      t.timestamps
    end
  end
end
