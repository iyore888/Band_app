class StaticPagesController < ApplicationController
  def home
    @posts = Post.paginate(page: params[:page]).search(params[:search])
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end