class Jobsearch < ActiveRecord::Base
  attr_accessible :contacted, :dateaccepted, :datecontacted, :datedeclined, :dateoffered, :daterejected, :declined, :firstsearchposition, :job_id, :offered, :rejected, :user_id
end
