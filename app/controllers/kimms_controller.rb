class KimmsController < ApplicationController
	before_action :authenticate_user!

	def index
		@kims = User.find(current_user).kimms.page(params[:page])
		authorize! :read_kim, current_user
	end

	def kim_approval
		@kims = Kimm.order("admin_approval ASC").page(params[:page])
		authorize! :kim_approval, current_user
	end

	def show
		@kim = Kimm.find(params[:id])
		authorize! :show_kim, @kim.user
	end

	def new
		@kim = Kimm.new
		authorize! :create_kim, current_user
	end

	def create
		@kim = User.find(current_user).kimms.new(params_kim)
		respond_to do |format|
	      if @kim.save
	        format.html { redirect_to kimms_path, notice: 'Kim has been added'}
	        format.json { render action: 'new', status: :created, location: @kim }
	      else
	        flash.now.alert = @kim.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @kim.errors, status: :unprocessable_entity }
	      end
	    end
	    authorize! :create_kim, current_user
	end

	def edit
		@kim = Kimm.find(params[:id])
		if params[:status] == "approve"
			@kim.admin_approval = true
			@kim.message = nil
			@kim.save
			flash[:notice] = "KIM has been approved"
			redirect_to kim_approval_path
		elsif params[:status] == "reject"
			@kim.admin_approval = false
			@kim.message = nil
			@kim.save
			flash[:alert] = "KIM has been rejected"
			redirect_to kim_approval_path
		elsif params[:status] == "rollback"
			@kim.message = params[:message]
			@kim.save
			flash[:notice] = "KIM rollback already"
			redirect_to kim_approval_path
		end
		authorize! :update_kim, current_user
	end

	def update
		@kim = Kimm.find(params[:id])
		if @kim.message != nil
			params[:kimm][:message] = nil
		end
	    respond_to do |format|
	      if @kim.update(params_kim)
	        format.html { redirect_to kimms_path, notice: 'Kim has been updated'}
	        format.json { render action: 'new', status: :created, location: @kim }
	      else
	        flash.now.alert = @kim.errors.full_messages.to_sentence
	        format.html { render action: "new" }
	        format.json { render json: @kim.errors, status: :unprocessable_entity }
	      end
	    end
	    authorize! :update_kim, current_user
	end

	def destroy

		authorize! :destroy_kim, current_user
	end

	def download
		file_name = params[:id]
		kim_id = params[:id2]
		if params[:status] == "stnk"
			image = Kimm.find(kim_id).stnk.path
		elsif params[:status] == "sim"
			image = Kimm.find(kim_id).sim.path
		elsif params[:status] == "kir"
			image = Kimm.find(kim_id).kir.path
		elsif params[:status] == "tera"
			image = Kimm.find(kim_id).tera.path
		elsif params[:status] == "ktp"
			image = Kimm.find(kim_id).ktp.path
		elsif params[:status] == "surat permohonan"
			image = Kimm.find(kim_id).surat_permohonan.path
		end
		send_file image
	end

private
	def params_kim
		params.require(:kimm).permit!
	end


end
