class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect to "/runs"
        else
            @errors = user.errors.full_messages.join(" - ")
            erb :"users/new"
        end
    end

    get "/login" do
        erb :"users/login"
    end

    post "/login" do
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect to "/runs"
        else
            redirect to "/login"
        end
    end
  
    get "/logout" do
        session.clear
        redirect to "/login"
    end

end