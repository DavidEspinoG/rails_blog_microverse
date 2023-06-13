class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = Post.first.five_most_recent_comments
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:post_id]
  end
end
