class CoursesController < ApplicationController
 
get '/courses' do
    @courses = Course.all
        erb :'/courses/index'
    end

get '/courses/new' do
         erb :'courses/new'
     end
 
get '/courses/:id' do
     @course = Course.find_by_id(params[:id])
       erb :'/courses/show'
     end

get '/courses/:id/edit' do
    if is_logged_in? && current_student == @course.student 
    @course = Course.find_by_id(params[:id])
    erb :'courses/edit'
    else 
        redirect "/courses/new" 
    end
end 

post '/courses' do
    @course = Course.create(params[:course])
    @course.student = current_student 
    @course.save 
    redirect to '/courses'
end 

patch '/courses/:id' do 
    course = Course.find(params[:id])
    course.update(params[:course])
    redirect to '/courses'
end 

delete '/courses/:id' do 
    @course = Course.find_by_id(params[:id])
    @course.delete
    redirect to '/courses' 
end 

end 