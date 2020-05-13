class GamesController < ApplicationController 

    get '/games' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = @user.lists
        erb :'games/show'
    end

    get '/games/new' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = List.all
        erb :'/games/new'
    end
    
    post '/games/new' do
        Game.create(:name => params[:name], :list_id => params[:list_id])
        redirect '/games'
        end
    
    
    get '/games/new/:id' do
        redirect_if_not_logged_in
        @list = List.find_by_id(params[:id])
        erb :'/games/new_on_list'
    end
    
    post '/games/new/:id' do
        @list = List.find_by_id(params[:id])
        Game.create(:name => params[:name], :list_id => params[:id])
        redirect '/games'
    end
    
    
    get '/games/:id/edit' do
        @game = Game.find_by_id(params[:id])
        erb :'/games/edit'
    end
    
    patch '/games/:id' do
        @game = Game.find_by_id(params[:id])
        @game.name = params[:name]
        @game.save
        redirect '/games'
    end
    
    
    get '/games/:id/delete' do 
        @game = Game.find_by_id(params[:id])
        erb :'/games/delete'
    end
    
    delete '/games/:id' do 
        @game = Game.find_by_id(params[:id])
        @game.destroy
        redirect '/games'
    end
    

end