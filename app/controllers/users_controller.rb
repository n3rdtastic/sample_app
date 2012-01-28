class UsersController < ApplicationController
  # don't allow signed-in users to visit :new or :create pages
  before_filter :anonymous_user, :only => [:new, :create]
  # require the user to be signed in to reach some pages
  before_filter :authenticate, :except => [:show, :new, :create]
  # restrict users to their own 'edit' and 'update' pages
  before_filter :correct_user, :only => [:edit, :update]
  # restrict destroying users to admins
  before_filter :admin_user, :only => :destroy
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
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
    user = User.find(params[:id])
    if !current_user?(user)
      user.destroy
      flash[:success] = "User destroyed."
    else
      flash[:error] = "You can't delete yourself."
    end
    redirect_to users_path
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end
  
  
  private
  
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def anonymous_user
      redirect_to(root_path) if signed_in?
    end
end
