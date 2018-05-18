class UniusersController < ApplicationController
	before_action :set_user, :only => [ :show, :edit, :update, :destroy]
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@user.save

		redirect_to uniusers_path
	end
	def show
	end
	def edit
	end
	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		redirect_to uniuser_url(@user)
	end
	def destroy
		@user.destroy
		redirect_to uniusers_url
	end


private
	def set_user
  		@user = User.find(params[:id])
	end
	def user_params
	  params.require(:user).permit(:email, :password)
	end
end
