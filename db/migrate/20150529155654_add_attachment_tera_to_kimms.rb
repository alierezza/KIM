class AddAttachmentTeraToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :tera
    end
  end

  def self.down
    remove_attachment :kimms, :tera
  end
end
