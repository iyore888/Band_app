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
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated!"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @messages = Message.all
  end
  
  private
  
  def post_params
    params.require(:post).permit(:subject, :content, :genre, :part, :age, :gender )
  end
  
end
