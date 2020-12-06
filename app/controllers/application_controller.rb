require './config/environment'

class ApplicationController < Sinatra::Base
 
  configure do
    register Sinatra::ActiveRecordExtension
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
  end
   
   get "/" do
    erb :'/students/new'
   end
  
   helpers do 
    def logged_in?
      !!session[:student_id]
   end 

   def current_student #memoization?  
    @current_student || Student.find_by_id(session[:student_id]) 
   end 


  #  get '/students/new' do
  #    erb :'/students/new'
  #  end

end
end 
