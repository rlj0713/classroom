require './config/environment'

class ApplicationController < Sinatra::Base

  	configure do
    	set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
  	end

  	get "/" do
    	erb :welcome
  	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

		# Returns true if the user doesn't already exists in the db. - For Sign-Up redundancy problem
		def is_valid
			!User.all.includes(params[:username]) || User.all == []
		end

		#I need to eliminate the chance that a user creates 2 sections with the same name
		def section_already_exists
		end
	end

end