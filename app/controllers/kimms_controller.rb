class KimmsController < ApplicationController
	before_action :authenticate_user!

	def index
		@kims = User.find(current_user).kimms.page(params[:page])
		authorize! :read_kim, current_user
	end

	def kim_approval
		if params[:rollback_id]
			@kim = Kimm.find(params[:rollback_id])
		end
		@kims = Kimm.search(params[:jenis_sim],params[:no_polisi],params[:tipe],params[:no_registration],params[:admin_approval_waiting],params[:admin_approval_rollback]).order("created_at DESC").page(params[:page])

		authorize! :kim_approval, current_user
	end

	def show
		@kim = Kimm.find(params[:id])

		#resend email
		if params[:status] == "email"
			UserMailer.delay.no_registration_kim(@kim.user,@kim)
			flash[:notice] = "Email has been sent"
			redirect_to kimms_path
		end
		authorize! :show_kim, @kim.user
	end


	def new
		@kim = Kimm.new

		authorize! :create_kim, current_user
	end

	def create
		if params[:kimm][:tipe] == "Skid Tank"
			params[:kimm][:kapasitas] = params[:kimm][:kapasitas].to_s + " Liter"
		end
		no_registration = SecureRandom.base64(10).split("=")[0]
		params[:kimm][:no_registrasi] = no_registration
		@kim = User.find(current_user).kimms.new(params_kim)
		respond_to do |format|
	      if @kim.save
	      	UserMailer.delay.no_registration_kim(current_user,@kim)
	        format.html { redirect_to kimms_path, notice: 'Kim has been added'}
	        format.json { render action: 'new', status: :created, location: @kim }
	      else
	      	@kim.errors.messages.delete(:sim)
	      	@kim.errors.messages.delete(:stnk)
	      	@kim.errors.messages.delete(:kir)
	      	@kim.errors.messages.delete(:tera)
	      	@kim.errors.messages.delete(:ktp)
	      	@kim.errors.messages.delete(:surat_permohonan)
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
			@kim.admin_approved_by = current_user.nama

			if @kim.masa_berlaku_tera == nil 
				expired = [@kim.masa_berlaku_sim , @kim.masa_berlaku_stnk, @kim.masa_berlaku_kir].min
			else
				expired = [@kim.masa_berlaku_sim , @kim.masa_berlaku_stnk, @kim.masa_berlaku_kir, @kim.masa_berlaku_tera].min
			end
			@kim.expired_date = expired
			@kim.save
			flash[:notice] = "KIM has been approved"
			redirect_to kim_approval_path
		elsif params[:status] == "reject"
			@kim.admin_approval = false
			@kim.crew_approval = false
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
		if params[:kimm][:tipe] == "Skid Tank"
			params[:kimm][:kapasitas] = params[:kimm][:kapasitas].to_s + " Liter"
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
		@kim = Kimm.find(params[:id])
		@kim.destroyflash[:alert] = "KIM has been deleted"
		redirect_to kimms_path
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

	def pdf_kim
		#show PDF when KIM approved
		@kim = Kimm.find(params[:id])
		output = CetakPDF.new(:page_size => [354.33 , 498.90], :margin => [0, 0]).print_kim(@kim)
	    send_data output, filename: "kim_#{@kim.no_polisi}.pdf", type: "application/pdf", disposition: "inline"

		authorize! :generate_kim, current_user
	end

private
	def params_kim
		params.require(:kimm).permit!
	end


end
