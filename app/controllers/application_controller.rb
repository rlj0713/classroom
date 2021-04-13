require './config/environment'

class ApplicationController < Sinatra::Base

  	configure do
    	set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
  	end

  	get "/" do
    	erb :index
  	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end

		# Returns false if the user already exists in the db.
		def is_unique
			!User.all.includes(params[:username]) || User.all == []
		end
	end

end