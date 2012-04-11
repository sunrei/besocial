class UsersController < ApplicationController
  load_and_authorize_resource :only => [:destroy, :edit, :update]

  # GET /users
  #-----------------------------------------------------------------------
  def index
    @users = User.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /users/1
  #-------------------------------------------------------------------
  def show
    @user = params[:id] ? User.find(params[:id]) : current_user
    respond_to do |format|
      format.js { }
      format.html
    end
  end

  # GET /users/1/edit
  #-------------------------------------------------------------------
  def edit
    @user = params[:id] ? User.find(params[:id]) : current_user
    respond_to do |format|
      format.html
    end
  end

  # DELETE /users/1
  #-------------------------------------------------------------------
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, :notice => "User was successfully deleted!" }
    end
  end

  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end

    respond_to do |format|
      if @user.errors[:base].empty? and @user.update_attributes(params[:user])
        flash[:notice] = "Your account has been updated"
        format.html { render :action => :edit }
      else
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def subscribe
    @subscription = current_user.subscriptions.create(:leader_id => params[:id])
    respond_to do |format|
      format.html {
        redirect_to user_path(params[:id]), :notice => (@subscription.errors.any? ? (@subscription.errors.full_messages * ',') : "You have successfully subscribed to this user.")
      }
      format.js {
        @user = User.find(params[:id])
        @subscribed = true
      }
    end
  end

  def unsubscribe
    @subscription = current_user.subscriptions.find_by_leader_id!(params[:id])
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to user_path(params[:id]) }
      format.js {
        @user = User.find(params[:id])
        @subscribed = false
        render :action => 'subscribe'
      }
    end
  end

  def news
    @news = current_user.news.paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.js
      format.html
    end
  end
end
