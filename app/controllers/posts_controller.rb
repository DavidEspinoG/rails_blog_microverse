class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = Post.first.five_most_recent_comments
  end

  def show
    @post = Post.find(params[:user_id])
  end
end
