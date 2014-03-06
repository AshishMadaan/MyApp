class PostsController < ApplicationController

	def index
 	 @posts = Post.all
	end

	def new
		@post=Post.new
	end
	def create
	  	@post = Post.new(post_params)
	 
	  	if @post.save
	  		redirect_to @post
	 	 else
	  	render 'new'
	  end
	end
 
 	def show
		@post = Post.find(params[:id])
	end

	def destroy
		
		@post = Post.find(params[:id])
		@comment = Comment.where(post_id: @post.id)
		@comment.each do |comment|
		  comment.destroy
		end
		@post.destroy
		redirect_to @post

		#@post = Post.find(params[:id])
		#@comment = @post.comments.find(params[:id])
		#@post.each do |post|
		#@post.destroy
		#redirect_to @post
		#end
	#@comment.destroy
	#redirect_to @post


	end
	#@comment.destroy
		
	def edit
		@post = Post.find(params[:id])
	end

	def update
		 @post = Post.find(params[:id])
 
		  if @post.update(params[:post].permit(:title, :text))
		    redirect_to @post
		  else
		    render 'edit'
		  end

	end

	private
	  def post_params
	    params.require(:post).permit(:title, :text, :user)
	  end

end
