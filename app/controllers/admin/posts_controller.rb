class Admin::PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(set_params)
		

		if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end

	end

	def show
		@post = Post.find(params[:id])
	end

	def update

		@post = Post.find(params[:id])

		if params[:destroy_logo] == "1"
    	@post.picture = nil
    end

		if @post.update(set_params)
			redirect_to admin_posts_path
    else
      render :edit
    end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to admin_posts_path
		
	end

	private

	def set_params
		params.require(:post).permit(:title, :content, :picture)
	end

end
