class RunsController < ApplicationController

    get "/runs/new" do #new - need to go before dynamic routes; loads a form
        erb :"/runs/new"
    end

    post "/runs" do #create
        run = Run.create(params)
        redirect to "/runs"
    end

    get "/runs" do #index
        @runs = Run.all
        erb :"runs/index"
    end

    get "/runs/:id" do #show
        @run = Run.find_by(id: params[:id])
        if @run
            erb :"runs/show"
        else
            redirect "/runs"
        end
    end
    
end