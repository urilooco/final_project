class SearchController < ApplicationController
    def index
        @users = User.by_username(params[:username])
    end
end
