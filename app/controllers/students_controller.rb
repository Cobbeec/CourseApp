class StudentsController < ApplicationController
  
  get '/signup' do 
    erb :'students/new'
  end 
  
  post '/signup' do 
    student = Student.new(params[:student])
    if student.save
      session[:student_id] = student.id 
      redirect to '/courses'
    else 
      @error = student.errors.full_messages.join("")
      erb :'students/new'
    end 
  end 

  #in theory should be in a sessionscontroller 
   
    get '/students/login' do 
      if is_logged_in?
        redirect '/courses'
      else 
      erb :'students/login'
    end 
  end 

    post '/login' do
      student = Student.find_by_username(params[:student][:username])
      if student && student.authenticate(params[:student][:password])  
      session[:student_id] = student.id 
      redirect to '/courses'
      else 
        redirect to '/login'
    end 
  end 

    get '/logout' do 
    session.clear 
    redirect to '/students/login'
    end 

end 
