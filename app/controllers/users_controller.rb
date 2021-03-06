class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup.html'
    end

    post '/users' do

        if params[:name] != "" && params[:email] != "" && params[:password] != "" 
        
            @user = User.create[params]
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end
    end

    get '/login' do
        erb :'users/login.html'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
        erb :'users/login.html' 
        end  
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
         
        erb :'users/show'
    end

    get  '/logout' do
        session.clear
        redirect '/'
    end
end 