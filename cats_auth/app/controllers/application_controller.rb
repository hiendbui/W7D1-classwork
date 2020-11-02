class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def already_logged_in
        redirect_to cats_url if logged_in?
    end

    def login_user!
        session[:session_token] = current_user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    
end