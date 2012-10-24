class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page]) unless !current_user.admin?
  end
  
  def show
    @user = User.find(params[:id]) unless correct_user
  end
  
  def new
    if !signed_in?
      @user = User.new
    else
      redirect_to root_url
    end
  end
  
  def create
    if !signed_in?
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to DOUGHNUT!"
        redirect_to @user
      else
        render 'new'
      end
    else
      redirect_to root_url
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
      redirect_to(root_path) unless current_user.admin?
    end
end
