class NamacrewsController < ApplicationController
	before_action :authenticate_user!
	before_action :check
	def index
		@crews = User.where("role=?","RealCrew").page(params[:page])
	end

	def new
		@crew = User.new
	end

	def create
		#params[:user][:email] = "#{SecureRandom.hex(5)}@xxx.com"
		#params[:user][:password] = "asdiusjdiad98sudasd"
		params[:user][:admin_approval] = 1
		params[:user][:role] = "RealCrew"
		params[:user][:created_by] = current_user.nama
		@crew = User.new(params_crew)
		respond_to do |format|
	      if @crew.save
	        format.html { redirect_to namacrews_path, notice: 'Crew has been added'}
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
	        format.html { redirect_to namacrews_path, notice: 'Crew has been updated'}
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
		flash[:notice] = "Crew has been deleted"
		redirect_to namacrews_path
	end


	private
	def params_crew
		params.require(:user).permit!
	end

	def check
		authorize! :namacrew, current_user
	end
end
