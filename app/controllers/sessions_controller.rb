class SessionsController < Devise::SessionsController

    def new
      
    end

    def create
        # set the value for role here
        rtn = super
        sign_in(resource.type.underscore, resource.type.constantize.send(:find, resource.id)) unless resource.type.nil?
        rtn
    end
end