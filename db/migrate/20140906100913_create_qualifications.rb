class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :subdivision
      t.string :industry

      t.timestamps
    end
  end
end
