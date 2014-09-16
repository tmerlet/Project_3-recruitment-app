class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :description
      t.boolean :abroad
      t.boolean :filled
      t.boolean :cancelled
      t.date :start_date
      t.date :end_date
      t.integer :company_id
      t.string :salary_range

      t.timestamps
    end
  end
end
