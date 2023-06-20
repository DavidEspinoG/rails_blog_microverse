class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:id])
  end

  def show
    @post = Post.includes(:comments).find(params[:post_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new author_id: current_user.id, title: params[:title],
                     text: params[:text], comments_counter: 0, likes_counter: 0
    if @post.save
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
