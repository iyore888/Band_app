class LikesController < ApplicationController
  before_action :logged_in_user
  
  def create
    @post = Post.find_by(id: params[:post_id])
    @post.iine(current_user)
  end

  def destroy
    @post = Like.find_by(id: params[:id]).post
    @post.uniine(current_user)
  end
end
