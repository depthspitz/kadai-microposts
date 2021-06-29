class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  before_action :pre_favorites, only: [:create, :destroy]
  
  
  def create
    current_user.favorite(micropost)
    flash[:primary] = 'Micropostをお気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    current_user.unfavorite(micropost)
    flash[:secondary] = 'Micropostのお気に入りを解除しました。'
    redirect_to root_url
  end
  
  private
  
  def pre_favorites
    micropost = Micropost.find(params[:micropost_id])
  end
  
end
