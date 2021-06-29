class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_favorites, only: [:create, :destroy]
  
  
  def create
    current_user.favorite(@micropost)
    flash[:primary] = 'Micropostをお気に入りに登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfavorite(@micropost)
    flash[:secondary] = 'Micropostのお気に入りを解除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_favorites
    @micropost = Micropost.find(params[:micropost_id])
  end
  
end
