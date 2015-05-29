class AddAttachmentKirToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :kir
    end
  end

  def self.down
    remove_attachment :kimms, :kir
  end
end
