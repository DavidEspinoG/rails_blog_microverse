class LikesController < ApplicationController
  def create
    @like = Like.create author_id: current_user.id, post_id: params[:post_id]
    redirect_to "/users/1/posts/#{@like.post_id}"
  end
end
