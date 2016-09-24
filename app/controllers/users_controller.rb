class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index,:show,:update]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_create_params)
		@user.role = 'User'
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_update_params)
		if @user.save
			flash[:success] = "Profile successfully updated"
			redirect_to :back
		else
			render 'show'
		end
	end

	private
		def user_create_params
			params.require(:user).permit(:username,:email,:password,:password_confirmation)
		end

		def user_update_params
			params.require(:user).permit(:fullname,:email,:password,:role,:address)
		end

end
