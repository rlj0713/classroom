require './config/environment'

class StudentsController < ApplicationController
# Should only have create (post route), update (patch route), and delete (delete route)
# No index or forms needed
# Display a lsit of students from the usesr show page
# Add and update students from a form.
# May need an edit to facilitate delete?


# Students where user_id == current_user[:user_id]


 # index
#  get "/sections" do
#   binding.pry
#   @sections = Section.find_by(session[:user_id])
#   erb :sections
# end

get "/:id/sections" do
  if logged_in?
    erb :'sections'
  else
    redirect "/login"
  end

  # Section.new(:name => "1st Period", :user_id => ["1234"])
  # @sections = Section.all
end

get '/students' do
  if logged_in?
    erb :sections
  else
    redirect "/login"
  end
end

# create
post "/students" do
  @student = Student.create(:user_id => current_user[:id], :name => params[:name], :section => params[:section].to_i, :score => params[:score])
  
  if !Student.all.includes(@student.name) && params[:section] != nil && params[:section] != ""
    @student.save
  end

  if @student.name == "John Doe"
    redirect "/user"
  else
    @new_students_section = params[:section]
    redirect "/user/#{current_user[:id]}/sections/#{@new_students_section.to_i}"
  end
end

get '/students_arranged' do
  erb :students_arranged
end

post 'sections' do
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

# #destroy
# delete "/articles/:id" do
#   Article.destroy(params[:id])
#   redirect to "/articles"
# end



end
