class CreateJobsearches < ActiveRecord::Migration
  def change
    create_table :jobsearches do |t|
      t.boolean :interested
      t.datetime :dateinterested
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
      t.integer :contractor_id

      t.timestamps
    end
  end
end
