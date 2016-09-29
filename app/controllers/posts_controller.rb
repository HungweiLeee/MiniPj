class PostsController < ApplicationController

	def index
		#@posts = Post.all
		params.permit!

		@q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(set_params)
		@post.save

		if @post.save
			format.html {redirect_to posts_path, notice: "Item is created."}
			format.json {render json: @post}
    else
      render :new
    end
    
	end

	def show
		@post = Post.find(params[:id])

		respond_to do |format|
      format.html
      format.json {
        render :json => { :id => @post.id, :title => @post.title }
      }
    end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
	end

	def help

		@post = Post.find( params[:id] )

    current_cart.add_line_item(@post)

    respond_to do |format|
      format.html {
        flash[:notice] = "加入成功"
        redirect_to :back
      }
      format.js
    end
	end

	def cancel
		@post = Post.find( params[:id] )

    line_item = current_cart.line_items.find_by( :post_id => @post.id )
    line_item.destroy

    respond_to do |format|
      format.html {
        flash[:notice] = "移除成功"
        redirect_to :back
      }
      format.js { render "help" }
    end
	end

	private

	def set_params
		params.require(:post).permit(:title, :content, :picture, :price, :q)
	end
	
end
