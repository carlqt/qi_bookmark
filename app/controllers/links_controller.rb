class LinksController < ApplicationController
  before_action :authenticate_user!

  # need to refactor!!
  def create
    if params[:commit] == 'Post'
      @link = current_user.links.new link_params

      if @link.save
        redirect_to user_path(current_user)
      else
        @shared_links = Kaminari.paginate_array(Link.viewable(current_user)).page(params[:page]).per(5)

        @user = current_user
        flash.now[:danger] = @link.errors.full_messages
        render template: "users/show"
      end

    elsif params[:commit] == 'Share'
      @link = current_user.links.new link_params
      @link.is_shared = true
      @link.save
      @link.shared_to_users << User.find(params[:shared_ids])
      flash[:success] = "Link posted"
      redirect_to user_path(current_user)
    end
  end

  private

  def link_params
    params.require(:link).permit(:name, :is_shared)
  end

end
