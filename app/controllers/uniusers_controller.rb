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
	def add_user_money
		p current_user.money
		amount = params["add_money"].to_s
		p amount
		current_user.money += amount.to_i
		current_user.save
		redirect_to managers_path
	end


private
	def set_user
  		@user = User.find(params[:id])
	end
	def user_params
	  params.require(:user).permit(:name, :email, :password, :money)
	end
end
