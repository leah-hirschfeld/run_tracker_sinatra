class RunsController < ApplicationController

    get "/runs" do #index
        erb :"runs/index"
    end


end