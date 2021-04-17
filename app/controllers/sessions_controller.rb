require './config/environment'

# Handles all sign-in / sign-up functionality

class SessionsController < ApplicationController

  	get "/signup" do
		erb :signup
	end

	post "/signup" do
		user = User.new(:username => params[:username], :password => params[:password])

		if is_unique || is_first_user
			user.save
			session[:user_id] = user.id
			redirect "/sections"
		else
			@reason = "a username that is not unique."
			erb :failure
		end
	end
	
	get "/login" do
		erb :login
	end
	
	post "/login" do
		user = User.find_by(:username => params[:username])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/sections"
		else
			@reason = "an incorrect password."
			erb :failure
		end
	end

	get "/failure" do
		erb :failure
	end

	get "/logout" do
		session.clear
		erb :welcome
	end

end
