class AddAttachmentKtpToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :ktp
    end
  end

  def self.down
    remove_attachment :kimms, :ktp
  end
end
