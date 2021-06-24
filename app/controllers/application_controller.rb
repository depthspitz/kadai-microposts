class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend
  
  private
  
  def require_user_logged_in
    unless logged_in? #unlessはifの反対。falseの時に処理を実行
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end
