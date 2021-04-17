
require './config/environment'

class NavbarController < Sinatra::Base


    get '/navbar' do
        "Hello World"
    end

end