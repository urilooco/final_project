class AuthorizationsController < ApplicationController
    before_action :authenticate_user!
end
