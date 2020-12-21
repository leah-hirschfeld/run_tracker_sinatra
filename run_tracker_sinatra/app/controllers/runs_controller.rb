class RunsController < ApplicationController

    get "/runs/new" do #new - need to go before dynamic routes; loads a form
        erb :"/runs/new"
    end

    post "/runs" do #create
        run = current_user.runs.create(params)
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

    get "/runs/:id/edit" do #edit
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            erb :"runs/edit"
        else
            redirect to "/runs"
        end
    end
    
    patch "/runs/:id/edit" do #update
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            @run.update(params[:run])
            redirect to "/runs/#{@run.id}"
        else
            redirect to "/runs"
        end
    end

    delete "/runs/:id" do #delete
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            @run.destroy
            redirect "/runs"
        else
            redirect to "/runs"
        end
    end

end