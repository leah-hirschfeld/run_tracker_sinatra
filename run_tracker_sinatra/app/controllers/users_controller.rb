class UsersController < ApplicationController

    get "/signup" do
        erb :"users/new"
    end

    post "/signup" do
        if params[:user].values.any?{|value| value.blank?}
            redirect to "/signup"
        else 
            user = User.create(params[:user])
            session[:user_id] = user.id
            redirect to "/runs"
        end
    end

end