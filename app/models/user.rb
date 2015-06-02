class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :async,
         :recoverable, :rememberable, :trackable, :validatable


# attr_accessor :login

  	def active_for_authentication?
	  super && admin_approval
	end

	has_many :kimms, :dependent => :destroy
  has_many :lkps, :dependent => :destroy

  has_attached_file :photo, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "https://e62f052f5d28591fecf4-064c57753a2609fd3fdb3247d142c1b4.ssl.cf1.rackcdn.com/empty-avatar-xl.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


  def self.weekly
    data = Hash.new
    data["jumlah_anggota_baru"] = User.where("DATE(created_at) < ? and DATE(created_at) >= ? and role = ?",Time.now.to_date,Time.now.to_date - 7.days,"User").count
    data["jumlah_pendaftar_kim"] = Kimm.where("DATE(created_at) < ? and DATE(created_at) >= ?",Time.now.to_date,Time.now.to_date - 7.days).count
    data["jumlah_kim_yang_disetujui"] = Kimm.where("DATE(created_at) < ? and DATE(created_at) >= ? and admin_approval = ? and crew_approval = ?",Time.now.to_date,Time.now.to_date - 7.days, true,true).count
    data["jumlah_kim_yang_ditolak"] = Kimm.where("DATE(created_at) < ? and DATE(created_at) >= ? and admin_approval = ? and crew_approval = ?",Time.now.to_date,Time.now.to_date - 7.days,false,false).count
    data["jumlah_lkp"] = Lkp.where("DATE(created_at) < ? and DATE(created_at) >= ?",Time.now.to_date,Time.now.to_date - 7.days).count
    data["jumlah_kim_habis_masa_berlaku"] = Kimm.where("DATE(expired_date) < ?",Time.now.to_date).count
    data["jumlah_kim_yang_menunggu_persetujuan"] = Kimm.where("admin_approval IS NULL or crew_approval IS NULL").count

    UserMailer.log(data,"Mingguan").deliver
  end
  
  def self.monthly
    data = Hash.new
    data["jumlah_anggota_baru"] = User.where("MONTH(created_at) = ? and role = ?",Time.now.to_date - 1.month,"User").count
    data["jumlah_pendaftar_kim"] = Kimm.where("MONTH(created_at) = ?",Time.now.to_date - 1.month).count
    data["jumlah_kim_yang_disetujui"] = Kimm.where("MONTH(created_at) = ? and admin_approval = ? and crew_approval = ?",Time.now.to_date - 1.month, true,true).count
    data["jumlah_kim_yang_ditolak"] = Kimm.where("MONTH(created_at) = ? and admin_approval = ? and crew_approval = ?",Time.now.to_date - 1.month,false,false).count
    data["jumlah_lkp"] = Lkp.where("MONTH(created_at) = ?",Time.now.to_date - 1.month).count
    data["jumlah_kim_habis_masa_berlaku"] = Kimm.where("DATE(expired_date) < ?",Time.now.to_date).count
    data["jumlah_kim_yang_menunggu_persetujuan"] = Kimm.where("admin_approval IS NULL or crew_approval IS NULL").count

    UserMailer.log(data, "Bulanan").deliver
  end

  def self.daily
    Kimm.where("admin_approval=? and crew_approval=?",true,true).each_with_index do |kim|
      if kim.expired_date.to_date >= Time.now.to_date    
        if kim.expired_date.to_date < Time.now.to_date + 1.month and kim.expired_date.to_date >= Time.now.to_date + 7.days 
            #kuning
            if Time.now.to_date == kim.expired_date.to_date - 7.days or Time.now.to_date == kim.expired_date.to_date - 14.days or Time.now.to_date == kim.expired_date.to_date - 21.days or Time.now.to_date == kim.expired_date.to_date - 28.days
              UserMailer.kim_expired_notif(kim.user,kim).deliver
            end
        elsif kim.expired_date.to_date < Time.now.to_date + 7.days and kim.expired_date.to_date >= Time.now.to_date 
            #oranye
            UserMailer.kim_expired_notif(kim.user,kim).deliver
        else
            #hijau do nothing
        end
      else
          #merah
          UserMailer.kim_expired_notif(kim.user,kim).deliver
      end
    end
  end


  

  
	
end
