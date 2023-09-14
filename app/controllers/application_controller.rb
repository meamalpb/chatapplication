class ApplicationController < ActionController::Base
    before_action :add_token  
    before_action :configure_permitted_parameters, if: :devise_controller?
    private
    def add_token 
        if user_signed_in?
            @ctoken = current_user.cabletoken 
            @uid = current_user.id
        else
            @ctoken = nil
            @uid = nil
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      end
end
