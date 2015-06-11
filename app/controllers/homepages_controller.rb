class HomepagesController < ApplicationController

	def index # halaman homepage awal
		@top_5_last_kim = Kimm.order("expired_date ASC").limit(5)

		# @top_crew = User.where("role=?","Crew").maximum("sign_in_count")
		@top_crew = User.where("role=?","Crew").order("sign_in_count ASC")

	end

	def show

	end

	def new

	end

	def create #contact us
		if verify_recaptcha
      UserMailer.delay.contact_us(params[:nama],params[:email],params[:konten])
			flash[:notice] = "Email has been sent"
			redirect_to homepages_path
    else
      flash[:alert] = "There was an error with the recaptcha."
			redirect_to homepages_path
      # render :new
    end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	def prasyarat #halaman prasyarat

	end

private
end
