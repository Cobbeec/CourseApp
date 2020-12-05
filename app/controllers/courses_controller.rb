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
    @course = Course.create(params)
    redirect to "/courses/#{@course.id}"
    end

patch '/courses/:id' do 
    course = Course.find(params[:id])
    course.update(params[:course])
    redirect to "/courses/#{courses.id}"
    end 

delete '/courses/:id' do 
    course = Course.find(params[:id])
    Course.destory(params[:id])
    redirect to '/courses' 
    end 

end 