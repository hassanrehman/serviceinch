class UsersController < ApplicationController

  #we dont have a signup OR register since agents (users) are made by admin
  def index
    @users = User.paginate :page => params[:page], :order => 'created_at DESC', :include => :user_access
  end

  def show
    @user = User.find(params[:id], :include => :user_access)
    render :layout => false
  end
  
  def edit
    @user = User.find(params[:id], :include => :user_access)
    @user_access = @user.user_access
    render :layout => false
  end
  
  # render new.rhtml
  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user = User.new(params[:user])
    @user.user_access = UserAccess.new(params[:user_access])
    
    success = @user && @user.save
    SFactory.all_users(true)  #update the locally maintained customers list from db

    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      # self.current_user = @user # !! now logged in
      redirect_to users_path
      flash[:notice] = "Agent Created Successfully."
    else
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])

    if @user.blank?
      flash[:error]  = "Invalid edit record"
      redirect_to users_path
    end
    success = @user.update_attributes(params[:user]) and
      @user.user_access.update_attributes(params[:user_access])

    SFactory.all_users(true)  #update the locally maintained customers list from db
    
    if success && @user.errors.empty?
      flash[:notice] = "User edited successfully..."
      redirect_to users_path
    else
      render :edit
    end
  end
end
