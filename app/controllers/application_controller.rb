class ApplicationController < ActionController::Base
protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
  		a = managers_path(current_user)		
  		managers_path #your path
	end

    include CartsHelper



end

