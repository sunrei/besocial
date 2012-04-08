class PostsController < ApplicationController
    def show
    end
    def create
        @post = Post.new
        @post.message = params[:message]
        @post.user_id = params[:user_id]
        @post.author_id = current_user.id
        if params[:pictures]
          params[:pictures].each do |picture|
            @post.pictures.build(:picture => picture)
          end
        end
        if @post.save
            redirect_to user_path(:id => params[:user_id])
        else
            @user = User.find(params[:user_id])
            render :template => "users/show"
        end
    end
    def destroy
      @post = Post.find(params[:id])
      authorize! :delete, @post
      @post.destroy

      respond_to do |format|
        format.json { respond_to_destroy(:ajax) }
        format.xml  { head :ok }
        format.html { redirect_to user_path(params[:user_id]), :notice => "Post was successfully deleted!" }
      end
    end
end