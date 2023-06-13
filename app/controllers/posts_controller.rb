class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = Post.first.five_most_recent_comments
  end

  def show
    @post = Post.find(params[:post_id])
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
      puts @post.errors.full_messages_for(:title).class
    end
  end

end
