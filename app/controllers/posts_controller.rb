class PostsController < ApplicationController
  def list
    @id = params[:id]
  end

  def show
    @user_id = params[:user_id]
    @post_id = params[:post_id]
  end
end
