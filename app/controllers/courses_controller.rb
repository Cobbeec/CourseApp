class CoursesController < ApplicationController
 get '/courses' do
        @courses = Course.all
        erb :'/courses/index'
    end

 get '/courses/new' do
      @courdes = Course.all
         erb :'/courses/new'
       end

end 