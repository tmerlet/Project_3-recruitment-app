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
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if params["qualifications"]
        params["qualifications"].each do |id| 
          qualification = Qualification.find(id.to_i)
          resource.qualifications << qualification
        end
      end
      resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end

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
        #removing al qualifications
        resource.qualifications = []
        #reassigning qualification
        if params["qualifications"]
          params["qualifications"].each do |id| 
            qualification = Qualification.find(id.to_i)
            resource.qualifications << qualification
          end
        end
        resource.save
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