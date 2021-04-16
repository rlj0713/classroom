require './config/environment'

class UsersController < ApplicationController
	# show
	get "/user/:users_id/sections/:id" do
		erb :sections
	end

	post "/user" do
		@section = Student.create(:user_id => current_user[:id], :name => params[:name] = "John Doe", :section => params[:section], :score => params[:score] = 100)
		if !Student.all.includes(@section)
		  	@section.save
		else
			@section.destroy
		end
		erb :user
	end
end
