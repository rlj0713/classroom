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
		@section = Section.new(:user_id => current_user[:id], :period_number => params[:period_number].to_i)
		if @section.valid?
			@section.save
		else
			erb :failure
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
			session[:section_id] = params[:id]
			erb :sections
		else
			redirect "/login"
		end
	end

	post "/delete_student" do
		if logged_in?
			@selected_student = params[:id]
			@selected_student = Student.find_by_id(@selected_student)
			@selected_student.delete
			redirect "/sections/#{session[:section_id]}"
		else
			redirect "/login"
		end
	end
end
