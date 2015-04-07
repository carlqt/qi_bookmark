class LinksController < ApplicationController
  before_action :authenticate_user!

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
      @link.user_shares << User.find(params[:shared_ids])
      redirect_to :back
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :is_shared)
  end

end