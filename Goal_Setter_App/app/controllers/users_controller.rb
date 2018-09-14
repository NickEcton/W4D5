class UsersController < ApplicationController
  def new 
    render :new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else 
      render :new
    end 
  end 
  
  
  
  def edit 
    @user = User.find(params[:id])
    render :edit 
  end 
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end 
  
  def index 
    @users = User.all
    render :index 
  end 
  
  def user_params 
    params.require(:user).permit(:username, :password)
  end 
  
end 