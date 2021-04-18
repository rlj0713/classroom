require './config/environment'

class StudentsController < ApplicationController
# Should only have create (post route), update (patch route), and delete (delete route)
# No index or forms needed
# Display a lsit of students from the usesr show page
# Add and update students from a form.
# May need an edit to facilitate delete?

get '/students' do
  if logged_in?
    erb :sections
  else
    redirect "/login"
  end
end

post "/students" do
  @student = Student.create(:user_id => current_user[:id], :name => params[:name], :section => params[:section].to_i, :score => params[:score])
  
  if !Student.all.includes(@student.name) && params[:section] != nil && params[:section] != ""
    @student.save
  end

  if @student.name == "John Doe"
    redirect "/:username"
  else
    @new_students_section = params[:section]
    redirect "/sections/#{@new_students_section.to_i}"
  end
end

get '/sections/:id/students_arranged' do
  erb :students_arranged
end

post '/sections/:id/students_arranged' do
  @selected_section = params[:id]
  erb :students_arranged
end

post '/sections' do
  if logged_in?
    erb :sections
  else
    redirect "/login"
  end
end

# post '/create_student' do
#   @student = Student.create(:user_id => current_user[:id], :name => params[:name], :section => params[:section], :score => params[:score])
#   if !Student.all.includes(@student.name)
#     @student.save
#   end
#   erb :sections
# end

# # show
# get "/articles/:id" do
#   @article = Article.find(params[:id])
#   erb :show
# end

# # edit
# get "/articles/:id/edit" do
#   @article = Article.find(params[:id])
#   erb :edit
# end

# # update
# patch "/articles/:id" do
#   @article = Article.find(params[:id])
#   @article.update(params[:article])
#   redirect to "/articles/#{ @article.id }"
# end




end
