class RestaurantEntriesController < ApplicationController
    get '/restaurant_entries/new' do
        erb :'/restaurant_entries/new'
    end 

    post /'restaurant_entries' do
        if !logged_in?
            redirect '/'
        end
        
        #check with hov video 4 52mins
        if  params[:content] != ""
            @restaurant_entry = RestaurantEntry.create(content: params[:content], user_id: current_user.id)
            redirect "/restaurant_entries/#{@restaurant_entry.id}"
        else
            redirect '/restaurant_entries/new'
        end
    end

    get '/restaurant_entries/:id' do
        @restaurant_entry = RestaurantEntry.find(params[:id])
        erb :'/restaurant_entries/show'
    end

    get '/restaurant_entries/:id/edit' do
       erb :/'restaurant_entries/edit'
    end


end 
