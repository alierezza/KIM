class UserMailer < ActionMailer::Base
	include Devise::Mailers::Helpers

	default from: "testing@hosting.natanetwork.com"

	def user_registration(user, password)
		#UserMailer.smtp
	    @user = user
	    @password = password
	    
	    mail(to: @user.email_recovery,
	         subject: "New User Registration")
  	end

  	def user_approved(user)
  		@user = user
  		mail(to: @user.email_recovery, subject: "Your account has been approved")
  	end

  	def no_registration_kim(user)
  		@user = user
      @kim = @user.kimms.last

  		mail(to: @user.email_recovery,
	         subject: "No Registration KIM")
  	end


  	def reset_password_instructions(record, token, opts={})
  		@token = token
    	devise_mail(record, :reset_password_instructions)
  	end


end
