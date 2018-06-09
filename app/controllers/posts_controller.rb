class PostsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]
	before_action :is_owner?, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all.order('created_at DESC')
	end
	
	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@post =  Post.find(params[:id])
		@post.destroy
		redirect_to root_path
	end

	def show
		@post =  Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:user_id, :photo, :caption)
	end

	def is_owner?
		if Post.find(params[:id]).user != current_user
			redirect_to root_path
		end
	end

end