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
# post '/signup' do 
#   if params[:student].values.any?{|v| v.blank?  }
#      redirect to '/signup'
#   else 
#    student = Student.create(params[:student])
#    session[:student_id] = student.id 
#    redirect to '/courses'
# end 
# end 
  # get '/students' do
  #       @students = Student.all
  #       erb :'/students/index' 
  #     end
    
  #     get '/students/new' do 
  #       erb :'/students/new'
  #     end
end 