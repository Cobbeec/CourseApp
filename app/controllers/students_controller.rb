class StudentsController < ApplicationController
  
  get '/signup' do 
    erb :'students/new'
  end 
  
  post '/signup' do 
    student = Student.new(params[:student])
    if student.save
      session[:student_id] = student.id 
      redirect to '/students/show' 
    else 
      @error = student.errors.full_messages.join("")
      erb :'students/new'
    end 
  end 

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
      redirect to "/students/#{student.id}"
      else 
        redirect to '/students/login'
    end 
  end 

  get '/students/:id/edit' do
    @student = Student.find_by_id(params[:id]) 
    @courses = @student.courses 
    erb :'/students/edit'
  end

  get '/students/:id' do 
   @student = Student.find_by_id(params[:id]) 
   @courses = @student.courses 
   erb :'students/show'
  end 

  patch '/students/:id' do
    @student = Student.find_by_id(params[:id]) 
    @student.update(params[:student])
    erb :'students/show'
  end
  

    get '/logout' do 
    session.clear 
    redirect to '/students/login'
    end 

end 
