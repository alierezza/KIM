class AddAttachmentSuratPermohonanToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :surat_permohonan
    end
  end

  def self.down
    remove_attachment :kimms, :surat_permohonan
  end
end
