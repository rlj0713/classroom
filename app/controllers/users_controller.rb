require './config/environment'

class UsersController < ApplicationController
	
	get "/sections" do
		if logged_in?
			@user_id = session[:user_id]
			erb :user
		else
			redirect "/login"
		end
	end
	
	post "/sections" do
		@section = Student.create(:user_id => current_user[:id], :name => params[:name] = "John Doe", :section => params[:section], :score => params[:score] = 100)
		if !Student.all.includes(@section) && params[:section] != ""
			@section.save
		end
		erb :user
	end
	
	get "/sections/:id" do
		if logged_in?
			@user_id = current_user[:id]
			@selected_section = params[:id]
			erb :sections
		else
			redirect "/login"
		end
	end

	post "/sections/:id" do
		if logged_in?
			@selected_section = params[:section]
			erb :sections
		else
			redirect "/login"
		end
	end
end
