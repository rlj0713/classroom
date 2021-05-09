require './config/environment'

class SectionsController < ApplicationController

  get "/sections" do
    if logged_in?
      @user = current_user
      erb :sections
    else
      redirect "/login"
    end
  end

  post "/sections" do
    @section = Section.new(:user_id => current_user[:id], :period_number => params[:period_number].to_i)
    if @section.valid?
      @section.save
    else
      redirect "/failure"
    end

    if @section[:period_number] == "0"
      Section.delete(@section)
    end

    redirect "/sections"
  end
  
  get "/sections/:id" do
    if logged_in?
      @section = Section.find_by_id(params[:id].to_i)
      session[:section_id] = params[:id]
      erb :students
    else
      redirect "/login"
    end
  end

  delete "/sections/:id" do
    if logged_in?
      @section = Section.find_by_id(params[:id])
      Section.delete(@section)
      redirect "/sections"
    else
      redirect "/login"
    end
  end

  get '/sections/:id/students_arranged' do
    erb :students_arranged
  end

end
