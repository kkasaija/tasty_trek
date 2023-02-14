class ApplicationController < ActionController::Base
    layout 'application'
    
    def current_user
        User.find(3)
    end
end
