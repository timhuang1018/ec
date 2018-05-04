class UsersController < ApplicationController
	before_action :set_user, :only => [ :show, :edit, :update, :destroy]
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def show
	end
	def edit
	end


	private
	def set_user
  		@user = User.find(params[:id])
	end
	def user_params
	  params.require(:user).permit(:name, :description,:price)
	end
end
