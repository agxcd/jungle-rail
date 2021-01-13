class Admin::SalesController < ApplicationController
 
    http_basic_authenticate_with name: ENV["USERNAME"].to_s, password: ENV["PASSWORD"].to_s

    def index
        @sales = Sale.all
    end
end
