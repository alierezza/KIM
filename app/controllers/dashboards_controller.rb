class DashboardsController < ApplicationController
	before_action :authenticate_user!

	def index 

	end

	def show

	end

	def new
		@kims = Kimm.where("crew_approval IS NULL").search_no(params[:search]).page(params[:page])
		
		authorize! :kim_approval_by_crew, current_user
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
			@kim.message = nil
			@kim.save
			flash[:alert] = "KIM has been rejected"
		end
		redirect_to new_dashboard_path
		authorize! :kim_approval_by_crew, current_user
	end

	def edit_info
		@user = User.find(params[:id])
		authorize! :edit_info, @user
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
	      if @user.update(params_user)
	        format.html { redirect_to dashboards_path, notice: 'User Info has been updated'}
	        format.json { render action: 'new', status: :created, location: @user }
	      else
	      	@user.errors.messages.delete(:photo)
	        flash.now.alert = @user.errors.full_messages.to_sentence
	        
	        format.html { render action: "edit_info" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end

		authorize! :edit_info, @user
	end

	def destroy

	end

private
	def params_user
		params.require(:user).permit!
	end
end
