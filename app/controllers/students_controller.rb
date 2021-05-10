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
    @student = Student.new(:section_id => session[:section_id].to_i, :name => params[:name], :score => params[:score].to_i)
    
    if @student.save
      redirect "/sections/#{@student.section_id}"
    else  
      @new_students_section = session[:section_id]
    end
  end

  get "/students/:id" do
    @selected_student = Student.find_by_id(params[:id])
    erb :edit_student
  end

  patch "/students/:id" do
    if logged_in?
      @selected_student = Student.find_by_id(params[:id])
      Student.update(params[:id], :name => params[:name], :score => params[:score])
      redirect "/sections/#{@selected_student.section_id}"
    else
      redirect "/login"
    end
  end

  delete "/students/:id" do
		if logged_in?
			Student.find_by_id(params[:id]).delete
			redirect "/sections/#{session[:section_id]}"
		else
			redirect "/login"
		end
	end
  
end
