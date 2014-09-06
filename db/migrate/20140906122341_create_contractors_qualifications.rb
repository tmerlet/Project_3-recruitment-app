class CreateContractorsQualifications < ActiveRecord::Migration
  def change
    create_table :contractors_qualifications, id: false do |t|
      t.integer :contractor_id
      t.integer :qualification_id
    end
  end
end
