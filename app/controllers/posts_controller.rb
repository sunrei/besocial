class PostsController < ApplicationController
    def show
    end
    def create
        @post = Post.new
        @post.message = params[:message]
        @post.user_id = params[:user_id]
        @post.author_id = current_user.id
        params[:pictures].each do |picture|
          @post.pictures.build(:picture => picture)
        end
        if @post.save
            redirect_to user_path(:id => params[:user_id])
        else
            @user = User.find(params[:user_id])
            render :template => "users/show"
        end
    end
end