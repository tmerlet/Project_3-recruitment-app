class RegistrationsController < Devise::RegistrationsController
  before_filter :determine_resource_type 

  def new

    super

    # if resource == contractor, add a new Address through the polymorphic assocation... started looking at the problem
    # if resource.type == "Contractor" 
    #   resource.address = Address.new
    # end
    binding.pry
  end

  def create
    puts "the resource that will be created is a #{@resource_type}"
    super

    # if resrouce == Contractor, save the new Address through the polymorphic association.  started looking at the problem
    # if resource.type == "Contractor"
    #   if resource.save
    #     binding.pry
    #     resource.address.save
    #   end
    # end
  end

  def determine_resource_type
    @resource_type = (request.env["REQUEST_PATH"] =~ /employees/) != nil ? Employee : Contractor
  end
end