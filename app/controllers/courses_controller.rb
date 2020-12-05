class CoursesController < ApplicationController
 get '/courses' do
    @courses = Course.all
        erb :'/courses/index'
    end

 get '/courses/new' do
    @courses = Course.all
         erb :'/courses/new'
       end

post '/courses' do
     @course = Course.create(params["course"])
        if !params["student"]["name"].empty?
        @course.student = Course.create(name: params["student"]["name"])
        end
        @course.save
        redirect to "courses/#{@course.id}"
      end

 get '/courses/:id' do
     @course = Course.find_by_id(params[:id])
       erb :'/courses/show'
     end

end 