class GamesController < ApplicationController 

    get '/games' do
        redirect_if_not_logged_in
        @user = current_user
        @lists = @user.lists
        erb :'games/show'
    end

end