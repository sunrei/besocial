class PostsController < ApplicationController
    def create
        @post = Post.new(params[:post])
        @post.user_id = params[:user_id]
        @post.author_id = current_user.id
        @post.save
        flash[:notice] =  @post.errors.any? ? ("Please correct errors: " + @post.errors.full_messages * ',') : "Post was successfully created"
        respond_to do |format|
          format.html {
            redirect_to user_path(:id => params[:user_id])
          }
          format.js{
            @user = User.find(params[:user_id])
            @wall = @user.wall_entries.paginate(:page => params[:page], :per_page => 15)
          }
        end
    end

    def destroy
      @post = Post.find(params[:id])
      authorize! :delete, @post
      @post.destroy
      redirect_to user_path(params[:user_id]), :notice => "Post was successfully deleted!"
    end
end