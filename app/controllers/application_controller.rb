class ApplicationController < ActionController::Base
  class ApplicationController < ActionController::Base
    include Response
    include Error
    
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!, :is_admin?
    def login!
      session[:user_id] = @user.id
    end
  
    def logged_in?
      !!session[:user_id]
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def authorized_user?
      @user == current_user
    end
  
    def logout!
      session.clear
    end
  
    def is_admin?
      logged_in? ? current_user.admin : false
    end
  end
end
