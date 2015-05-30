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
  	validates_attachment_content_type :sim, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :stnk, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :stnk, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :kir, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :kir, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :tera, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :tera, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :ktp, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :ktp, :content_type => /\Aimage\/.*\Z/

  	has_attached_file :surat_permohonan, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :surat_permohonan, :content_type => /\Aimage\/.*\Z/

end
