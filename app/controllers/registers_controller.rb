class RegistersController < ApplicationController

	def index

	end

	def show

	end

	def new
		@user = User.new
	end

	def create
		if verify_recaptcha
			@user = User.new(params_user)
			password = SecureRandom.urlsafe_base64(5)
			@user.password = password
			@user.password_confirmation = password
			@user.email_recovery = params[:user][:email]

			respond_to do |format|
	     if @user.save
	     	UserMailer.delay.user_registration(@user,password)
	       format.html { redirect_to homepages_path, notice: 'New User was successfully created, please check your email'}
	       format.json { render action: 'index', status: :created, location: @user }
	     else
	       flash.now.alert = @user.errors.full_messages.to_sentence
	       format.html { render action: "new" }
	       format.json { render json: @user.errors, status: :unprocessable_entity }
	     end
   		end
   	else
      flash[:alert] = "There was an error with the recaptcha."
			redirect_to new_register_path
      # render :new
    end
	end

	def edit

	end

	def update

	end

	def destroy

	end
private
	def params_user
		params.require(:user).permit!
	end
end
