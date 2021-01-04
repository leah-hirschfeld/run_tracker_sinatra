class RunsController < ApplicationController

    get "/runs/new" do
        erb :"/runs/new"
    end

    post "/runs" do
        run = current_user.runs.create(params)
        redirect to "/runs"
    end

    get "/runs" do
        @runs = Run.all
        erb :"runs/index"
    end

    get "/runs/:id" do
        @run = Run.find_by(id: params[:id])
        if @run
            erb :"runs/show"
        else
            redirect "/runs"
        end
    end

    get "/runs/:id/edit" do
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            erb :"runs/edit"
        else
            redirect to "/runs"
        end
    end
    
    patch "/runs/:id/edit" do
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            @run.update(params[:run])
            redirect to "/runs/#{@run.id}"
        else
            redirect to "/runs"
        end
    end

    delete "/runs/:id" do
        @run = Run.find_by(id: params[:id])
        if @run.user == current_user
            @run.destroy
            redirect "/runs"
        else
            redirect to "/runs"
        end
    end

end