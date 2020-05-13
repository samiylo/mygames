class ListsController < ApplicationController 

    get '/lists/new' do
        redirect_if_not_logged_in
        erb :'/lists/new'
    end

    post '/lists/new' do
        @user = current_user
        list = @user.lists.create(:name => params[:name])
        game = list.games.create(:name => params[:games][:name])
        redirect '/games'

    end
    
    get '/lists/:id/edit' do
        redirect_if_not_logged_in
        @list = List.find_by_id(params[:id])
        erb :'lists/edit'
    end
    
    patch '/lists/:id' do 
        @list = List.find_by_id(params[:id])
        @list.name = params[:name]
        @list.save
        redirect '/games'
    end
    
    get '/lists/:id/delete' do
        @list = List.find_by_id(params[:id])
        erb :'lists/delete'
    end
    
    delete '/lists/:id' do 
        @list = List.find_by_id(params[:id])
        @list.destroy
        redirect '/games'
    end
end