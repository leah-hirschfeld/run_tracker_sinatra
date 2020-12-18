class RunsController < ApplicationController

    get "/runs" do #index
        @runs = Run.all
        erb :"runs/index"
    end

    get "/runs/:id" do #show
        @run = Run.find_by(id: params[:id])
        erb :"runs/show"
    end
end