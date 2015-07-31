class Kimm < ActiveRecord::Base


	belongs_to :user

	validates :jenis_sim, :presence=>true
	validates :masa_berlaku_sim, :presence=>true
	validates :masa_berlaku_stnk, :presence=>true
	validates :masa_berlaku_kir, :presence=>true
	# validates :masa_berlaku_tera, :presence=>true
	validates :no_polisi, :presence=>true
	validates :tipe, :presence=>true
	validates :kapasitas, :presence=>true

	  has_attached_file :sim, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :sim, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :stnk, :styles => { :medium => "300x300>", :thumb => "100x100>" } , :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :stnk, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :kir, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :kir, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

    has_attached_file :kir_skid_tank, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
    validates_attachment :kir_skid_tank, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :tera, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :tera, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :ktp, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :ktp, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }

  	has_attached_file :surat_permohonan, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
  	validates_attachment :surat_permohonan, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }


    has_attached_file :checklist, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.hollandlift.com/wp-content/themes/hollandlift/assets/images/no_image.jpg"
    validates_attachment :checklist, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"]}, :size => { :less_than => 1000.kilobytes }


    before_validation :uppercase_nopol

    def uppercase_nopol
      self.no_polisi.upcase!
    end


  def self.search_no(no_registration)
  no_registration = no_registration ? no_registration.upcase : ""
 
    query_adv_domain_name = " (upper(no_registrasi) LIKE '%#{no_registration}%' )"

    if no_registration != ""
      where("upper(no_registrasi) like ?", "%#{no_registration}%")
    else
      all
    end
  end

  def self.search(jenis_sim,no_polisi,tipe,no_registrasi,waiting,rollback)

      jenis_sim = jenis_sim ? jenis_sim.upcase : ""
      no_polisi = no_polisi ? no_polisi.upcase : ""
      tipe = tipe ? tipe.upcase : ""
      no_registrasi = no_registrasi ? no_registrasi.upcase : ""
      waiting = waiting ? waiting.upcase : ""
      rollback = rollback ? rollback.upcase : ""

      query_no_registrasi = " (upper(no_registrasi) LIKE '%#{no_registrasi}%' )"
      query_jenis_sim = jenis_sim == "" ? nil : "AND (upper(jenis_sim) LIKE '%#{jenis_sim}%' )"
      query_no_polisi = no_polisi == "" ? nil : "AND (upper(no_polisi) LIKE '%#{no_polisi}%' )"
      query_tipe = tipe == "" ? nil : "AND (upper(tipe) LIKE '%#{tipe}%' )"
      query_waiting = waiting == "" ? nil : "AND ( admin_approval IS NULL and message IS NULL )"
      query_rollback = rollback == "" ? nil : "AND ( message IS NOT NULL  )"

      where("#{query_no_registrasi} #{query_jenis_sim} #{query_no_polisi} #{query_tipe} #{query_waiting} #{query_rollback}")

  end

  
end
