class RunsController < ApplicationController
    #:belongs_to User

    get "/runs" do #index
        @runs = Run.all
        erb :"runs/index"
    end

    get "/runs/new" do #new - need to go before dynamic routes
        erb :"/runs/new"
    end

    get "/runs/:id" do #show
        @run = Run.find_by(id: params[:id])
        erb :"runs/show"
    end
    
end