class UserMailer < ActionMailer::Base

	default from: "testing@hosting.natanetwork.com"

	def user_registration(user, password)
		#UserMailer.smtp
	    @user = user
	    @password = password
	    
	    mail(to: @user.email_recovery,
	         subject: "New User Registration")
  	end

end
