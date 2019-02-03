class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to root_url
  end
  
  private
  
  def  user_params
    params.require(:user).permit(:name ,:email , :password, :password_confirmation)
  end
  
  
end




