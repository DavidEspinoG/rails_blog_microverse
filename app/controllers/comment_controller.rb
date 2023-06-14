class CommentController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new author_id: params[:author_id], post_id: params[:post_id],
                           text: params[:text]
    if @comment.save
      redirect_to "/users/#{@comment.author.id}/posts/#{@comment.post.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
