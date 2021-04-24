require './config/environment'

class ApplicationController < Sinatra::Base

  	configure do
    	set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
  	end

  	get "/" do
		if logged_in?
			redirect "/sections"
		else
			erb :index
		end
  	end

	helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find_by(id: session[:user_id])
		end

		def is_unique
			User.find_by_username(params[:username]) == nil
		end

		def is_first_user
			User.all == []
		end
	end

end