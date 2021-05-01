#require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension


  configure do
   enable :sessions
   set :session_secret, "RestuarantReviewApp"

   set :public_folder, 'public'
   set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
