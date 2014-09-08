class RegistrationsController < Devise::RegistrationsController
  before_filter :determine_resource_type 
  

  def new
    build_resource({})
    if resource.type == "Contractor"
      resource.build_address
    end
    @validatable = devise_mapping.validatable?
    if @validatable
      @minimum_password_length = resource_class.password_length.min
    end
    respond_with self.resource
  end


  def create
    puts "the resource that will be created is a #{@resource_type}"
    super

  end

  def determine_resource_type
    @resource_type = (request.env["REQUEST_PATH"] =~ /employees/) != nil ? Employee : Contractor
  end
end