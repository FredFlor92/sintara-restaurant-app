class RestaurantEntriesController < ApplicationController
    
    get '/restaurant_entries' do
        @restaurant_entries = @RestaurantEntry.all
        erb :'restaurant_entries/index'
    end
    
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
        set_restaurant_entry
        erb :'/restaurant_entries/show'
    end

    get '/restaurant_entries/:id/edit' do
        set_restaurant_entry
        if logged_in?
        if authorized_to_edit?(@restaurant_entry)
       erb :/'restaurant_entries/edit'
        else
            redirect "users/#{current_user.id}"
        end
        else
            redirect'/'
        end
    end  
    patch '/restaurant_entries/:id' do
        set_restaurant_entry
        if  logged_in?
           if @restaurant_entry.update(content: params[:content])
            redirect "/restaurant_entries/#{@restaurant_entry.id}"
        else
            redirect "users/#{current_user.id}"
        end
    end 
    
    private
    def set_restaurant_entry
        @restaurant_entry = RestaurantEntry.find(params[:id])
    end
end 
