class ManagersController < ApplicationController
	def home
	end
	def index
	end
	def create
	end
	def show_date
		@b = Time.now
	    @a = 0
	end
	def update
		@b = @b + @a.days 

	end
end
