require './config/environment'

class SectionController < ApplicationController

  get "/sections/:id" do
    erb :sections
  end
  # index
  # get "#{current_user}/sections" do
  #   @sections = Section.all
  #   erb :'crud/user_index'
  # end

  # new
  # get "#{current_user}/sections/new" do
  #   @section = Section.new
  #   erb :'crud/new'
  # end

  # # create
  # post "#{current_user}/sections" do
  #   @section = Section.create(params)
  #   redirect to "#{current_user}/sections/#{ @section.id }"
  # end

  # # show
  # get "#{current_user}/sections/:id" do
  #   @section = Section.find(params[:id])
  #   erb :'crud/show'
  # end

  # # edit
  # get "#{current_user}/sections/:id/edit" do
  #   @section = Section.find(params[:id])
  #   erb :'crud/edit'
  # end

  # # update
  # patch "#{current_user}/sections/:id" do
  #   @section = Section.find(params[:id])
  #   @section.update(params[:section])
  #   redirect to "#{current_user}/sections/#{ @section.id }"
  # end

  # #destroy
  # delete "#{current_user}/sections/:id" do
  #   Section.destroy(params[:id])
  #   redirect to "#{current_user}/sections"
  # end

end
