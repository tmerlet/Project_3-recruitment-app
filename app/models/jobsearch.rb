class Jobsearch < ActiveRecord::Base
  attr_accessible :contacted, :dateaccepted, :datecontacted, :datedeclined, :dateoffered, :daterejected, :declined, :firstsearchposition, :job_id, :offered, :rejected, :contractor_id

  belongs_to :contractors
  belongs_to :jobs

end
