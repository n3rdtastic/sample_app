class UsersController < ApplicationController
  # require the user to be signed in to reach some pages
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  # restrict users to their own 'edit' and 'update' pages
  before_filter :correct_user, :only => [:edit, :update]
  # restrict destroying users to admins
  before_filter :admin_user, :only => :destroy
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end # index
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end # create
  
  def edit
    @title = "Edit user"
  end # edit
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end # update
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
