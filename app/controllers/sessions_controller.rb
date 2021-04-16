require './config/environment'

# Handles all sign-in / sign-up functionality

class SessionsController < ApplicationController

  	get "/signup" do
		erb :signup
	end

	post "/signup" do
		user = User.new(:username => params[:username], :password => params[:password])
		
		if is_valid
			user.save
			redirect "/login"
		else
			redirect "/failure"
		end
	end
	
	get "/login" do
		erb :login
	end
	
	post "/login" do
		user = User.find_by(:username => params[:username])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect "/user"
		else
			redirect "/failure"
		end
	end

	get "/user" do
		if logged_in?
			erb :user
		else
			redirect "/login"
		end
	end

	get "/failure" do
		erb :failure
	end

	get "/logout" do
		session.clear
		redirect "/"
	end

end
