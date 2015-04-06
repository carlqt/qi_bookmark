class UsersController < ApplicationController
  def index
    @link = Link.new
    @shared_links = Link.includes(:user)
  end

  def create
    if params[:commit] == 'Post'
      @link = Link.new link_params

      if @link.save
        redirect_to :back
      else
        render :index
      end

    elsif params[:commit] == 'Share'
      
    end

    binding.pry
    'lol'
  end

  private

  def link_params
    params.require(:link).permit(:name)
  end
end
