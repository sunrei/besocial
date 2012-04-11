class CommentsController < ApplicationController
  def create

    #validation
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comment = Comment.new(params[:comment])
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    @comment.save
    respond_to do |format|
      format.html{ redirect_to user_path(@post.user_id) }
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :delete, @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@comment.post.user_id), :notice => "Comment was successfully deleted!" }
    end
  end
end