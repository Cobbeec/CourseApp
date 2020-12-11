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
        redirect "/courses/new" 
    end
end 

post '/courses' do
    @course = current_student.courses.build(params[:course])
    if params[:title] != "" && @course.save
        redirect "/courses/#{@course.id}"
    else 
        erb :'/courses/new' #are you using @course on your new page? Your instance 
        #variable just travels with the request. Doesn't go from route to route. Goes with 
        #http request 
end 
end 


patch '/courses/:id' do 
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
    #add route protections 
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


