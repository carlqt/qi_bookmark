class UsersController < ApplicationController
  def index
    @link = Link.new
    @shared_links = Link.includes(:user).order(created_at: :desc)
  end

  def create
    if params[:commit] == 'Post'
      @link = current_user.links.new link_params

      if @link.save
        redirect_to :back
      else
        render :index
      end

    elsif params[:commit] == 'Share'
      @link = current_user.links.new link_params
      @link.save

      Relationship.shared_users params[:shared_ids]
    end

  end

  private

  def link_params
    params.require(:links).permit(:name)
  end
end
