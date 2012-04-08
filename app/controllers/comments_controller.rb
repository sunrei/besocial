class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_path(@post.user_id)
    else
      render :template => "users/show"
    end
  end
end