class ApplicationController < ActionController::Base
    before_action :add_token  

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
end
