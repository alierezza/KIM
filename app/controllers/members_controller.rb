class MembersController < ApplicationController
	before_action :authenticate_user!
	
	def index 
		@users = User.where("role=? ","User").search(params[:nama]).order("admin_approval ASC").page(params[:page])
		authorize! :user_approval, current_user
	end

	def show
		@user = User.find(params[:id])
		authorize! :user_approval, current_user
	end

	def new

		params.each_with_index do |user|
			if user.first.split("_")[0] == "user" and params[:commit] == "Approve All"
				@user = User.find(user.second)
				@user.admin_approval = true
				@user.approved_by = current_user.nama
				@user.save
				flash[:notice] = "all users already approved"
			end
			if user.first.split("_")[0] == "user" and params[:commit] == "Reject All"
				@user = User.find(user.second)
				@user.destroy
				flash[:alert] = "all users already deleted"
			end
		end
	
		redirect_to members_path
		authorize! :user_approval, current_user
	end

	def create

	end

	def edit
		if params[:status]
			@user = User.find(params[:id])
			@user.admin_approval = params[:status]
			@user.approved_by = current_user.nama
			@user.save
			if params[:status] == "true"
				UserMailer.delay.user_approved(@user)
				flash[:notice] = "User has been approved"
			else
				UserMailer.delay.delete_member(@user)
				@user.destroy
				flash[:alert] = "User has been Rejected"
			end
			redirect_to members_path
		end
		
		authorize! :user_approval, current_user
	end

	def update

	end

	def destroy
		@user = User.find(params[:id])
		UserMailer.delay.delete_member(@user)
		@user.destroy
		flash[:notice] = "User has been deleted"
		redirect_to members_path
		authorize! :user_approval, current_user
	end

private
end
