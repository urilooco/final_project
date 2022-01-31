class SearchController < ApplicationController
    def show
        @users = User.where("username LIKE ?", "%" + params[:username] + "%")
    end
end
