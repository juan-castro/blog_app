class PostsController < ApplicationController
	def index
		@posts = Post.all
		@user = User.find(params[:user_id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def edit
		@post = Post.find(params[:id])
		@user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
		@post = Post.new(params[:post])

		@post.user = @user

		if @post.save
			redirect_to [@user, @post], notice: "Post was succesfully created."
		else
			render action: "new"
		end
	end

	def update
		@post = Post.find(params[:id])
		@user = User.find(params[:user_id])

		if @post.update_attributes(params[:post])
			redirect_to [@user, @post], notice: "Post was succesfully updated."
		else
			render action: "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		@user = User.find(params[:user_id])

		redirect_to user_posts_url
	end
end

