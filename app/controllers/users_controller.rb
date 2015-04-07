class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @link = Link.new
    @shared_links = Link.viewable(current_user)
  end

  def show
    @user = User.friendly.find params[:id]
    @link = Link.new
    @shared_links = Link.viewable(current_user)

  end

  def create

  end


end
