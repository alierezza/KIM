class UserMailer < ActionMailer::Base
	include Devise::Mailers::Helpers
  include ApplicationHelper

	default from: "admin@kotakgadget.com"

	  def user_registration(user, password)
	    @user = user
	    @password = password

	    mail(to: @user.email_recovery,
	         subject: "Informasi Pendaftaran Akun Portal LTMS Pertamina")
  	end

  	def user_approved(user)
  		@user = user
      #attachments.inline["pertamina.jpg"] = File.read("http://findicons.com/files/icons/2141/web_design_creatives/128/small_smile.png")
  		mail(to: @user.email_recovery, subject: "Informasi Akun Telah Aktif")
  	end

  	def no_registration_kim(user,kim)
  		@user = user
      @kim = kim

      pdf = CetakPDF.new(:page_size => [595.28, 841.89], :margin => [0, 0]).print_pdf(@kim)
      attachments["registrasi_#{@kim.no_polisi}.pdf"] = {
         :content => pdf,
         :mime_type => 'application/pdf'
      }
      mail(to: @user.email_recovery,
	         subject: "[KIM] Nomor Registrasi KIM")
  	end

  	def reset_password_instructions(record, token, opts={})
  		@token = token
    	devise_mail(record, :reset_password_instructions, :subject=>"Instruksi Reset Password")
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

    def contact_us(nama,email,konten)
      @nama = nama
      @email = email
      @konten = konten

      mail(to: User.find_by(:role=>"SuperAdmin").email_recovery, subject: "Seseorang telah menghubungi anda")
    end

    def delete_member(user)
      @user = user
      mail(to: User.find(@user).email_recovery, subject: "Akun Gagal Masuk Ke Sistem")
    end
end
