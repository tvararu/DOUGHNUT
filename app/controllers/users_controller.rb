class UsersController < ApplicationController
  before_filter :signed_out_user, only: [:new, :create]
  before_filter :signed_in_user,  only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user,    only: [:show, :edit, :update]
  before_filter :admin_user,      only: [:index, :destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to DOUGHNUT!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    target = User.find(params[:id])
    if current_user?(target)
      redirect_to root_path
    else
      target.destroy
      flash[:success] = "User destroyed."
      redirect_to users_url
    end
  end
  
private
  def signed_out_user
    if signed_in?
      store_location
      redirect_to root_url
    end
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless signed_in? && current_user.admin?
  end
end
