class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index 
		
	end

	def show

	end

	def new
		@kims = Kimm.where("crew_approval IS NULL").page(params[:id])
	end

	def create

	end

	def edit
		@kim = Kimm.find(params[:id])
		if params[:status] == "approve"
			@kim.crew_approval = true
			@kim.crew_approved_by = current_user.nama
			@kim.save
			flash[:notice] = "KIM has been approved"
		elsif params[:status] == "reject"
			@kim.crew_approval = false
			@kim.admin_approval = false
			@kim.save
			flash[:alert] = "KIM has been rejected"
		end
		redirect_to new_dashboard_path

	end

	def update

	end

	def destroy

	end

private
end
