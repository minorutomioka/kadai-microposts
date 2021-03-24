class FavoritesController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_micropost
    
    
  def create
    @favorite = Favorite.create(user_id: current_user.id, micropost_id: @micropost.id)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to root_url
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,micropost_id: @micropost.id)
    @favorite.destroy
    flash[:success] = 'お気に入りから外しました。'
    redirect_to root_url
  end
  
  
    private
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
  
  
end
