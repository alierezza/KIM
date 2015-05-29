class AddAttachmentStnkToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :stnk
    end
  end

  def self.down
    remove_attachment :kimms, :stnk
  end
end
