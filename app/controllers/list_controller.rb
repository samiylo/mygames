class ListsController < ApplicationController 

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'/lists/new'
    end
end