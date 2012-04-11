class PostsController < ApplicationController
    def create
        @post = Post.new(params[:post])
        @post.user_id = params[:user_id]
        @post.author_id = current_user.id
        @post.save
        flash[:notice] = ("Please correct errors: " + @post.errors.full_messages * ',') if @post.errors.any?
        redirect_to user_path(:id => params[:user_id])
    end

    def destroy
      @post = Post.find(params[:id])
      authorize! :delete, @post
      @post.destroy
      redirect_to user_path(params[:user_id]), :notice => "Post was successfully deleted!"
    end
end