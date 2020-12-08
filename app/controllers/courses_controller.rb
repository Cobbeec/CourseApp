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
    @course = Course.new(params[:course])
    if valid_params? && @course.save
        redirect "/courses/#{@course.id}"
    else 
        erb : "courses/new"
    end 
end 


patch '/courses/:id' do 
    @course = Course.find_by_id(params[:id])
    if valid_params? && @course.update(params[:course])
        redirect "/courses/#{@course.id}"
    else 
        redirect "/courses/#{@course.id}"/edit 
end 
end 

delete '/courses/:id' do 
    @course = Course.find_by_id(params[:id])
    @course.delete
    redirect to '/courses' 
end 

end 