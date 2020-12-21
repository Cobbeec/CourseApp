class CoursesController < ApplicationController
 
get '/courses' do
    @courses = Course.all
        erb :'/courses/index'
    end

get '/courses/new' do
    if is_logged_in? 
         erb :'courses/new'
    else 
        flash[:message] = "Your login is not valid. Please try again"  
        erb :'students/login'
     end
end 
 
get '/courses/:id' do 
    if @course = Course.find_by_id(params[:id])
       erb :'/courses/show'
    else 
        redirect "/courses"
     end
    end 

get '/courses/:id/edit' do
    @course = Course.find_by_id(params[:id])
    if is_logged_in? && current_student == @course.student 
    erb :'courses/edit'
    else 
        flash[:message] = "You do not have access to this file."  
        redirect "/courses"
    end
end 

post '/courses' do
    course = current_student.courses.build(params[:course])
    if params[:title] != "" && course.save
        redirect "/courses/#{course.id}"
    else 
        erb :'/courses/new'
end 
end 


patch '/courses/:id' do 
    #binding.pry 
    course = Course.find_by_id(params[:id])
    if is_logged_in? && course.student == current_student && params[:title] != "" 
        course.update(params[:course])
        redirect "/courses/#{course.id}"
    else 
        flash[:message] = "You do not have access to this file."  
        redirect "/courses/#{course.id}/edit"
    end 
end 

delete '/courses/:id' do 
    @course = Course.find_by_id(params[:id])
    if is_logged_in? && @course.student == current_student && params[:title] != "" 
    @course.destroy 
    redirect to '/courses'
    else 
        flash[:message] = "You do not have access to this file."  
        redirect "/courses/#{course.id}/edit"
 end 
end 

end 


