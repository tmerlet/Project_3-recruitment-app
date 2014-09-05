class CreateJobsearches < ActiveRecord::Migration
  def change
    create_table :jobsearches do |t|
      t.boolean :contacted
      t.datetime :datecontacted
      t.boolean :offered
      t.datetime :dateoffered
      t.boolean :rejected
      t.datetime :daterejected
      t.boolean :dateaccepted
      t.boolean :declined
      t.datetime :datedeclined
      t.integer :firstsearchposition
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
