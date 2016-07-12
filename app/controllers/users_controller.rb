class UsersController < ApplicationController

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
		@user = User.new(user_params)
		@user.role = 'User'
		@user.save

		redirect_to :back
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_update_params)

		@user.save
		redirect_to :back
	end

	private
		def user_params
			params.require(:user).permit(:username,:password)
		end
		def user_update_params
			params.require(:user).permit(:fullname,:email,:role,:address)
		end
end
