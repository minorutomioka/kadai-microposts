class FavoritesController < ApplicationController
    before_action :require_user_logged_in
    before_action :set_micropost
    
    
  def create
    @favorite = current_user.favorites.build(micropost_id: params[:micropost_id])
    @favorite.save
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = current_user.favorites.find_by(micropost_id: @micropost.id)
    @favorite.destroy
    flash[:success] = 'お気に入りから外しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end
  
  
end
