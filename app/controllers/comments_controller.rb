class CommentsController < ApplicationController
  def create

    #validation
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @comment = Comment.new
    @comment.comment = params[:comment]
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to user_path(@post.user_id)
    else
      #redirect
      render :template => "users/show_page"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :delete, @comment
    @comment.destroy

    respond_to do |format|
      format.json { respond_to_destroy(:ajax) }
      format.xml  { head :ok }
      format.html { redirect_to user_path(@comment.post.user_id), :notice => "Comment was successfully deleted!" }
    end
  end
end