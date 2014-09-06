class CreateJobsQualifications < ActiveRecord::Migration
  def change
    create_table :jobs_qualifications, id: false do |t|
      t.integer :job_id
      t.integer :qualification_id
    end
  end
end
