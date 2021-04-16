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

get "/user/:id/sections" do
  # Section.new(:name => "1st Period", :user_id => ["1234"])
  # @sections = Section.all
  erb :'sections'
end

# create
post "/students" do
  @student = Student.create(:user_id => current_user[:id], :name => params[:name] = "John Doe", :section => params[:section], :score => params[:score] = 100)
  if !Student.all.includes(@student.name)
    @student.save
  end
  erb :user
end

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
