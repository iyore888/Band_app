class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:info] = "New post is successed!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
  end
  
  def show
  end
  
  private
  
  def post_params
    params.require(:post).permit(:subject, :content, :genre, :part, :age, :gender )
  end
  
end
