class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user,   only:[:edit, :update]
  
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = @user.posts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated?
  end
  
  def index
    @users = User.where(activated: true).paginate(page: params[:page]).search(params[:search])
    
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def  user_params
    params.require(:user).permit(:name ,:email ,:content, :genre, :part, :age, :gender, :artist, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end
  
end




