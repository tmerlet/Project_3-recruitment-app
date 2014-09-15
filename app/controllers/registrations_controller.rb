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



  def update

     self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
     prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

     resource_updated = update_resource(resource, account_update_params)
     yield resource if block_given?
     if resource_updated
       if is_flashing_format?
         flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
           :update_needs_confirmation : :updated
         set_flash_message :notice, flash_key
       end
       sign_in resource_name, resource, bypass: true
       respond_with resource, location: after_update_path_for(resource)
     else
       clean_up_passwords resource
       respond_with resource
     end
   end
end