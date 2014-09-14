# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


contractor1 = Contractor.create(name: "contractor1", email: "contractor1@gmail.com", password: "password", password_confirmation: "password", available_now: false)
contractor2 = Contractor.create(name: "contractor1", email: "contractor2@gmail.com", password: "password", password_confirmation: "password", available_now: false)


employee1 = Employee.create(name: "Employee", email: "employee1@gmail.com", password: "password", password_confirmation: "password")
employee2 = Employee.create(name: "Employee", email: "employee2@gmail.com", password: "password", password_confirmation: "password")

company1 = Company.create(name: "Funny business")
company2 = Company.create(name: "Dull business")

job1 = Job.create(description: "an amazing job", abroad: false, filled: false, cancelled: false, start_date: "19/12/2014", end_date: "21/01/2015")

job2 = Job.create(description: "boring job")

jobsearch1 = Jobsearch.create()
jobsearch2 = Jobsearch.create()

qualification1 = Qualification.create(name: "iata level 1")
qualification2 = Qualification.create(name: "iata level 2")

address1 = Address.create(line1: "30 murrayfield road", city: "edinburgh", postcode: "eh12 6er", country: "uk" )
address2 = Address.create(line1: "32 murrayfield road", city: "edinburgh", postcode: "eh12 6er", country: "uk" )
address3 = Address.create(line1: "34 murrayfield road", city: "edinburgh", postcode: "eh12 6er", country: "uk" )


puts ""
puts "COMPANY"
puts ""

puts "has_one address"
company1.address = address1
puts "company1.address: #{company1.address}"
puts "address1.addressable: #{address1.addressable} "
puts ""

puts "has_many jobs"
company1.jobs << job1
company1.jobs << job2
puts "company1.jobs: #{company1.jobs}"
puts ""

puts "has_many employees"
company1.employees << employee1
company1.employees << employee2
puts "company1.employees: #{company1.employees}"
puts ""

puts ""
puts "JOB"
puts ""

puts "has_one address"
job1.address = address2
puts "job1.address: #{job1.address}"
puts ""
# NOTE THAT THE SAME ADDRESS CANNOT BE USED FOR DIFFERENT MODELS

puts "has_many jobsearches"
job1.jobsearches << jobsearch1
job1.jobsearches << jobsearch2
puts "job1.jobsearches: #{job1.jobsearches}"
puts ""

puts "belongs_to company"
puts "job1.company: #{job1.company}"
puts ""

puts "has_and_belongs_to_many :qualifications"
job1.qualifications << qualification1
qualification2.jobs << job1
puts "job1.qualifications: #{job1.qualifications}"
puts ""

puts ""
puts "JOBSEARCH"
puts ""

puts "belongs_to job"
puts "jobsearch1.job: #{jobsearch1.job}"
puts ""

puts "belongs_to contractor"
contractor1.jobsearches << jobsearch1
puts "jobsearch1.contractor: #{jobsearch1.contractor}"
puts ""

puts ""
puts "EMPLOYEE"
puts ""

puts "belongs_to company"
puts "employee1.company: #{employee1.company}"
puts ""

puts ""
puts "CONTRACTOR"
puts ""

puts "belongs_to company"
puts "employee1.company: #{employee1.company}"
puts ""

puts "has_one :address, as: :addressable"
contractor1.address = address3
puts "contractor1.address: #{contractor1.address}"
puts ""

puts "has_many :jobsearches"
puts "contractor1.jobsearches: #{contractor1.jobsearches}"
puts""


puts "has_and_belongs_to_many :qualifications"
contractor1.qualifications << qualification1
qualification2.contractors << contractor1
puts "contractor1.qualifications: #{contractor1.qualifications}"
puts ""

puts ""
puts "QUALIFICATION"
puts ""

puts "has_and_belongs_to_many :contractors"
puts "qualification1.contractors: #{qualification1.contractors}"
puts ""

puts "has_and_belongs_to_many :jobs"
puts "qualification1.jobs: #{qualification1.jobs}"
puts ""

puts ""
puts "ADDRESS"
puts ""

puts "belongs_to :addressable, :polymorphic => true"
puts "address1.addressable: #{address1.addressable}"
puts "address2.addressable: #{address2.addressable}"
puts "address3.addressable: #{address3.addressable}"
puts ""

puts ""
puts "RETURN THE JOBSEARCHES WHERE CONTRACTOR_ID == 1"
puts "Jobsearch.where(contractor_id: '1'): #{Jobsearch.where(contractor_id: '1')}"







