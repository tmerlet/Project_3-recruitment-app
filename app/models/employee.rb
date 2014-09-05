class Employee < User
  attr_accessible :company_id

  belongs_to :company
end
