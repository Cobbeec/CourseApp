require './config/environment'

class ApplicationController < Sinatra::Base
 
  configure do
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    set :public_folder, 'public'
    set :views, 'app/views'
  end

   get "/" do
    erb :'/students/new'
   end

   get '/students/new' do
     erb :'/students/new'
   end

end
