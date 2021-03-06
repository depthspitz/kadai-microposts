class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_relation, only: [:create, :destroy]
  
  
  def create
    current_user.follow(@user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to @user
  end

  def destroy
    current_user.unfollow(@user)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to @user
  end
  
  private
  
  def set_relation
    @user = User.find(params[:follow_id])
  end
    
  
end
