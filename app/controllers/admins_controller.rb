class AdminsController < ApplicationController
	before_action :authenticate_user!

	def index
		@admins = User.where("role = ?","Admin").page(params[:page])
	
	end

	def new
		@admin = User.new

	end

	def create
		params[:user][:email_recovery] = params[:user][:email]
		params[:user][:role] = "Admin"
		params[:user][:admin_approval] = true
		params[:user][:created_by] = current_user.nama
		@admin = User.new(params_admin)
		respond_to do |format|
	      if @admin.save
	        format.html { redirect_to dashboards_path, notice: 'Admin has been added'}
	        format.json { render action: 'new', status: :created, location: @admin }
	      else
	        flash.now.alert = @admin.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @admin.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
		@admin = User.find(params[:id])
	end

	def update
		@admin = User.find(params[:id])
		respond_to do |format|
	      if @admin.update(params_admin)
	        format.html { redirect_to dashboards_path, notice: 'Admin has been updated'}
	        format.json { render action: 'new', status: :created, location: @admin }
	      else
	        flash.now.alert = @admin.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @admin.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@admin = User.find(params[:id])
		@admin.destroy
		flash[:notice] = "Admin has been deleted"
		redirect_to dashboards_path
	end

private
	def params_admin
		params.require(:user).permit!
	end
end
