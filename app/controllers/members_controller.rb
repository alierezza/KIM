class MembersController < ApplicationController
	before_action :authenticate_user!
	
	def index 
		@users = User.where("role=?  and admin_approval=?","User",false).all
		authorize! :user_approval, @user
	end

	def show

	end

	def new

	end

	def create

	end

	def edit
		if params[:status]
			@user = User.find(params[:id])
			@user.admin_approval = params[:status]
			@user.save
			if params[:status] == "true"
				flash[:notice] = "User has been approved"
				redirect_to members_path
			else
				@user.destroy
				flash[:alert] = "User has been Rejected"
				redirect_to dashboards_path
			end
		end
		
		authorize! :user_approval, @user
	end

	def update

	end

	def destroy

	end

private
end
