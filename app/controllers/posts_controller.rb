class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(set_params)
		@post.save

		if @post.save
      redirect_to posts_path
    else
      render :new
    end
    
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
	end

	private

	def set_params
		params.require(:post).permit(:title, :content, :picture)
	end
	
end
