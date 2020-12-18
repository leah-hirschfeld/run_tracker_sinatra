class RunsController < ApplicationController

    get "/runs" do #index
        @runs = Run.all
        erb :"runs/index"
    end


end