class UserMailer < ActionMailer::Base
	include Devise::Mailers::Helpers

	default from: "testing@hosting.natanetwork.com"

	def user_registration(user, password)
	    @user = user
	    @password = password
	    
	    mail(to: @user.email_recovery,
	         subject: "[KIM] Detail Account Anda")
  	end

  	def user_approved(user)
  		@user = user
  		mail(to: @user.email_recovery, subject: "[KIM] Account telah di setujui oleh admin")
  	end

  	def no_registration_kim(user,kim)
  		@user = user
      @kim = kim

  		mail(to: @user.email_recovery,
	         subject: "[KIM] Nomor Registrasi KIM")
  	end

  	def reset_password_instructions(record, token, opts={})
  		@token = token
    	devise_mail(record, :reset_password_instructions)
  	end
    

    def kim_expired_notif(user,kim) 
      @user = user
      @kim = kim
      mail(to: @user.email_recovery, subject: "[KIM] Notifikasi Peringatan tanggal jatuh tempo KIM")
    end

    def log(data,status)
      @status = status
      @data = data

      mail(to: User.find_by(:role=>"SuperAdmin").email_recovery, subject: "[KIM] LOG #{@status}")
    end

end
