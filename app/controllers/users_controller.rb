class UsersController < ApplicationController
  load_and_authorize_resource :only => [:destroy, :edit, :update]

  # GET /users
  # GET /users.xml
  # GET /users.json                                       HTML and AJAX
  #-----------------------------------------------------------------------
  def index
    @users = User.paginate(:page => params[:page])
    respond_to do |format|
      format.json { render :json => @users }
      format.xml  { render :xml => @users }
      format.html
    end
  end

  # GET /users/new
  # GET /users/new.xml
  # GET /users/new.json                                    HTML AND AJAX
  #-------------------------------------------------------------------
  #def new
  #  respond_to do |format|
  #    format.json { render :json => @user }
  #    format.xml  { render :xml => @user }
  #    format.html
  #  end
  #end

  # GET /users/1
  # GET /users/1.xml
  # GET /users/1.json                                     HTML AND AJAX
  #-------------------------------------------------------------------
  def show
    @user = params[:id] ? User.find(params[:id]) : current_user
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.js { }
      format.html
    end
  end

  # GET /users/1/edit
  # GET /users/1/edit.xml
  # GET /users/1/edit.json                                HTML AND AJAX
  #-------------------------------------------------------------------
  def edit
    @user = params[:id] ? User.find(params[:id]) : current_user
    respond_to do |format|
      format.json { render :json => @user }
      format.xml  { render :xml => @user }
      format.html
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  # DELETE /users/1.json                                  HTML AND AJAX
  #-------------------------------------------------------------------
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { redirect_to users_path, :notice => "User was successfully deleted!" }
    end
  end

  # POST /users
  # POST /users.xml
  # POST /users.json                                      HTML AND AJAX
  #-----------------------------------------------------------------
  #def create
  #  @user = User.new(params[:user])
  #
  #  if @user.save
  #    respond_to do |format|
  #      format.json { render :json => @user.to_json, :status => 200 }
  #      format.xml  { head :ok }
  #      format.html { redirect_to :action => :index }
  #    end
  #  else
  #    respond_to do |format|
  #      format.json { render :text => "Could not create user", :status => :unprocessable_entity } # placeholder
  #      format.xml  { head :ok }
  #      format.html { render :action => :new, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << "The password you entered is incorrect" unless @user.valid_password?(params[:user][:current_password])
    end

    respond_to do |format|
      if @user.errors[:base].empty? and @user.update_attributes(params[:user])
        flash[:notice] = "Your account has been updated"
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        format.json { render :text => "Could not update user", :status => :unprocessable_entity } #placeholder
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def subscribe
    #TODO validation
    if current_user.id == params[:id]
      redirect_to user_path(params[:id]), :notice => "You cannot subsribe to yourself"
    else
      #TODO validation uniquiness
      @subscription = current_user.subscriptions.build(:leader_id => params[:id])
      if @subscription.save
        respond_to do |format|
          format.html { redirect_to user_path(params[:id]), :notice => "You have successfully subscribed to this user." }
          format.js { @user = User.find(params[:id]) }
        end
      else
        redirect_to user_path(params[:id]), :error => "Unable to subscribe."
      end
    end
  end


  def unsubscribe
    subscription = current_user.subscriptions.find_by_leader_id!(params[:id])
    if !subscription
      redirect_to user_path(params[:id]), :notice => "You are not subscribed to this user"
    elsif subscription.destroy
      respond_to do |format|
        format.html { redirect_to user_path(params[:id]), :notice => "You have unsubscribed." }
        format.js {
          @user = User.find(params[:id])
          render :action => 'subscribe'
        }
      end
    else
      redirect_to user_path(params[:id]), :error => "Unable to unsubscribe."
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