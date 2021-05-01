#require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension


  configure do
    set :public_folder, 'public'
   set :views, 'app/views'
   enable :sessions
   set :session_secret, "RestuarantReviewApp"
  end

  get "/" do
    erb :welcome
  end

end
