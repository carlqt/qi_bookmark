class UsersController < ApplicationController
  def index
    @links = Link.includes(:user)
  end
end
