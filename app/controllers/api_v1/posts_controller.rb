class ApiV1::PostsController < ApiController

	respond_to :json, :xml

	def index
    @posts = Post.all

    respond_with @posts
  end

  def show
  	@post = Post.find(params[:id])

  	respond_with Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create

    @post = Post.new( :title => params[:title],:content => params[:content] )

    #respond_with Post.create(set_params)

		if @post.save
			respond_with @post
		else
			render :json => { :message => "failed", :errors => @post.errors }, :status => 400
		end
	end

	def update
		respond_with Post.update(params[:id], set_params)
	end

	private

	def set_params
		params.require(:post).permit(:title, :content)
	end

end
