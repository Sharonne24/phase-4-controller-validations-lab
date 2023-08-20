class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

      def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
          redirect_to post_path(@post), notice: 'Post was successfully updated.'
        else
          flash.now[:error] = @post.errors.full_messages
          render :edit
        end
      end
    
      private
    
      def post_params
        params.require(:post).permit(:title, :category, :content)
      end
    end
    
