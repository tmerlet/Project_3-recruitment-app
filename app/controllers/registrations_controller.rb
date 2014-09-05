class RegistrationsController < Devise::RegistrationsController
  before_filter :determine_resource_type 

  def new 
    
    super
  end

  def create
    puts "the resource that will be created is a #{@resource_type}"
    super
  end

  def determine_resource_type
    @resource_type = (request.env["REQUEST_PATH"] =~ /employees/) != nil ? Employee : Contractor
  end
end