require './config/environment'

class SectionController < ApplicationController

  get "/sections/:username" do
    erb :sections
  end

end
