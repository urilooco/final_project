class SearchController < ApplicationController
    def index
        # @users = User.where("username LIKE ?", "%" + params[:username] + "%")
        @users = User.by_username(params[:username])
    end
end
