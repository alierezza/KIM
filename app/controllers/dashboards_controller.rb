class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index #panel
		
	end

	def show

	end

	def new

	end

	def create

	end

	def edit #ganti password diri sendiri
		# @user = User.find(params[:id])
		# @user.password =
		# @user.password_confirmation = 
		# if @user.save
		# 	flas[:notice] = "New password has been set"
		# else
		# 	flash[:alert] = "Failed to change password"
		# end
		# redirect_to dashboards_path

	end

	def update

	end

	def destroy

	end

private
end
