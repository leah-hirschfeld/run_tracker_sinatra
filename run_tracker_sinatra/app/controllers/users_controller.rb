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
            redirect to "/signup"
        end
    end

end