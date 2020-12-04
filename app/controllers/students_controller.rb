class StudentsController < ApplicationController
    get '/students' do
        @students = Student.all
        erb :'/students/index' 
      end
    
      get '/students/new' do 
        erb :'/students/new'
      end
end 