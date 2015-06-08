class HomepagesController < ApplicationController

	def index # halaman homepage awal
		@top_5_last_kim = Kimm.order("expired_date ASC").limit(5)

		@top_crew = User.where("role=?","Crew").maximum("sign_in_count")

	end

	def show

	end

	def new 
		
	end

	def create #contact us
		UserMailer.delay.contact_us(params[:nama],params[:email],params[:konten])
		flash[:notice] = "Email has been sent"
		redirect_to homepages_path
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
