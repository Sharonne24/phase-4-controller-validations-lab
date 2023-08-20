class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

      def create
        @author = Author.new(author_params)
    
        if @author.save
          redirect_to authors_path, notice: 'Author was successfully created.'
        else
          flash.now[:error] = author.errors.full_messages
          render :new
        end
      end
    
      private
    
      def author_params
        params.require(:author).permit(:name, :email)
      end
    end

