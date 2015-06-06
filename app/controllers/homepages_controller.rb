class HomepagesController < ApplicationController

	def index # halaman homepage awal

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
