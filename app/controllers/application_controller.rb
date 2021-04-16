require './config/environment'

class ApplicationController < Sinatra::Base

  	configure do
    	set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
  	end

  	get "/" do
		if logged_in?
			redirect "/user"
		else
			erb :welcome
		end
  	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

		# Returns true if the user doesn't already exists in the db. - For Sign-Up redundancy problem
		def is_unique
			User.find_by_username(params[:username]) == nil
		end

		def is_first_user
			User.all == []
		end

	end

end