class CoursesController < ApplicationController
 
get '/courses' do
    @courses = Course.all
        erb :'/courses/index'
    end

get '/courses/new' do
    @courses = Course.all
         erb :'courses/new'
     end
 
get '/courses/:id' do
     @course = Course.find_by_id(params[:id])
       erb :'/courses/show'
     end

get '/courses/:id/edit' do
    @course = Course.find(params[:id])
      erb :'courses/edit'
    end

post '/courses' do
    @course = Course.create(params[:course])
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