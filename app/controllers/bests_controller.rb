class BestsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bests = User.where("role=? or role=?","Admin","Crew").search(params[:nama]).page(params[:page])

		if params[:id] and params[:status]
			if User.where("role=? or role=? and best=?","Admin","Crew",true).count == 0
				@user = User.find(params[:id])
				@user.best = params[:status]
				@user.save
			else
				User.where("role=? or role=? and best=?","Admin","Crew",true).each_with_index do |user|
					user.best = false
					user.save
				end
					@user = User.find(params[:id])
					@user.best = params[:status]
					@user.save
				
			end
			flash[:notice] = "Best of the month has been set"
			
			redirect_to bests_path
		end

		authorize! :best_of_the_month, current_user
	end


	private
end
