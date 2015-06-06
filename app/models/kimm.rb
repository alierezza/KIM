class Kimm < ActiveRecord::Base


	belongs_to :user

	validates :jenis_sim, :presence=>true
	validates :masa_berlaku_sim, :presence=>true
	validates :masa_berlaku_stnk, :presence=>true
	validates :masa_berlaku_kir, :presence=>true
	validates :masa_berlaku_tera, :presence=>true
	validates :no_polisi, :presence=>true
	validates :tipe, :presence=>true
	validates :kapasitas_tangki, :presence=>true

	  has_attached_file :sim, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :sim, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :stnk, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :stnk, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :kir, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :kir, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :tera, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :tera, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :ktp, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :ktp, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :surat_permohonan, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment :surat_permohonan, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }


    validate :file_sim, :unless => "errors.any?"

    def file_sim
      if sim.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(sim.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:sim,'Width or height must be lest or equal than 200px')
        end
      end
    end

    validate :file_stnk, :unless => "errors.any?"

    def file_stnk
      if stnk.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(stnk.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:stnk,'Width or height must be lest or equal than 200px')
        end
      end
    end

    validate :file_kir, :unless => "errors.any?"

    def file_sim
      if kir.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(kir.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:kir,'Width or height must be lest or equal than 200px')
        end
      end
    end

    validate :file_tera, :unless => "errors.any?"

    def file_sim
      if tera.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(tera.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:tera,'Width or height must be lest or equal than 200px')
        end
      end
    end

    validate :file_ktp, :unless => "errors.any?"

    def file_sim
      if ktp.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(ktp.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:ktp,'Width or height must be lest or equal than 200px')
        end
      end
    end

    validate :file_surat_permohonan, :unless => "errors.any?"

    def file_sim
      if surat_permohonan.queued_for_write[:original] != nil
        dimensions = Paperclip::Geometry.from_file(surat_permohonan.queued_for_write[:original].path)

        if dimensions.width > 200 && dimensions.height > 200
          errors.add(:surat_permohonan,'Width or height must be lest or equal than 200px')
        end
      end
    end






    before_validation :uppercase_nopol

    def uppercase_nopol
      self.no_polisi.upcase!
    end


  def self.search(no_registration)
  no_registration = no_registration ? no_registration.upcase : ""
 
    query_adv_domain_name = " (upper(no_registrasi) LIKE '%#{no_registration}%' )"

    if no_registration != ""
      where("upper(no_registrasi) like ?", "%#{no_registration}%")
    else
      all
    end
  end

  
end
