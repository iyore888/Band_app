class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
    @post  = current_user.posts.build
  end

  def help
  end
  
  def about
  end
end
