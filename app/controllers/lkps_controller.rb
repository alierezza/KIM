class LkpsController < ApplicationController
	before_action :authenticate_user!
	def index
		@lkps = Lkp.order('created_at DESC').page(params[:page])
		authorize! :view_lkp, current_user
	end

	def show
		@lkp = Lkp.find(params[:id])
		authorize! :view_lkp, current_user
	end

	def new
		@lkp = Lkp.new
		authorize! :create_lkp, current_user
	end

	def create
		@lkp = User.find(current_user).lkps.new(params_lkp)
		respond_to do |format|
	      if @lkp.save
	        format.html { redirect_to dashboards_path, notice: 'LKP has been submitted'}
	        format.json { render action: 'new', status: :created, location: @lkp }
	      else
	        flash.now.alert = @lkp.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @lkp.errors, status: :unprocessable_entity }
	      end
	    end
		authorize! :create_lkp, current_user
	end

	def edit

	end

	def update

	end

	def destroy

	end
private
	def params_lkp
		params.require(:lkp).permit!
	end
end
