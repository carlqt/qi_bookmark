class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find params[:id]
    @link = Link.new
    @shared_links = Kaminari.paginate_array(Link.viewable(current_user)).page(params[:page]).per(5)
  end

end
