class KimmsController < ApplicationController
	before_action :authenticate_user!

	def index
		@kims = User.find(current_user).kimms.all
	end

	def show

	end

	def new
		@kim = Kimm.new
	end

	def create

	end

	def edit

	end

	def update

	end

	def destroy

	end

private
end
