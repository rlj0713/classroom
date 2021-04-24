require './config/environment'

class StudentsController < ApplicationController

  get '/students' do
    if logged_in?
      erb :students
    else
      redirect "/login"
    end
  end

  post "/students" do
    @student = Student.new(:section_id => session[:section_id].to_i, :name => params[:name], :score => params[:score].to_i, :user_id => session[:user_id].to_i)
    
    if @student.valid?
      @student.save
    end
    
    @new_students_section = session[:section_id]
    redirect "/sections/#{@new_students_section.to_i}"
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

  post "/edit_student" do
		if logged_in?
			@selected_student = Student.find_by_id(params[:id])
			erb :edit_student
		else
			redirect "/login"
		end
	end
  
  post "/patch_student" do
    if logged_in?
      Student.update(params[:id], :name => params[:name], :score => params[:score])
      redirect "/sections/#{session[:section_id]}"
    else
      redirect "/login"
    end
  end
  
end
