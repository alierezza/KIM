class CrewsController < ApplicationController
	before_action :authenticate_user!

	def index
		@crews = User.where("role=?","Crew").page(params[:page])
	end

	def new
		@crew = User.new
	end

	def create
		params[:user][:email_recovery] = params[:user][:email]
		params[:user][:role] = "Crew"
		params[:user][:admin_approval] = true
		params[:user][:created_by] = current_user.nama
		@crew = User.new(params_crew)
		respond_to do |format|
	      if @crew.save
	        format.html { redirect_to dashboards_path(:page=>"crew"), notice: 'Asisten HSE has been added'}
	        format.json { render action: 'new', status: :created, location: @crew }
	      else
	        flash.now.alert = @crew.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @crew.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
		@crew = User.find(params[:id])
	end

	def update
		@crew = User.find(params[:id])
		respond_to do |format|
	      if @crew.update(params_crew)
	        format.html { redirect_to dashboards_path(:page=>"crew"), notice: 'Asisten HSE has been updated'}
	        format.json { render action: 'new', status: :created, location: @crew }
	      else
	        flash.now.alert = @crew.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @crew.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@crew = User.find(params[:id])
		@crew.destroy
		flash[:notice] = "Asisten HSE has been deleted"
		redirect_to dashboards_path(:page=>"crew")
	end

private
	def params_crew
		params.require(:user).permit!
	end
end
