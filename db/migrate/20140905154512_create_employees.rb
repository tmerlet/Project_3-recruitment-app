class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :company_id

      t.timestamps
    end
  end
end
