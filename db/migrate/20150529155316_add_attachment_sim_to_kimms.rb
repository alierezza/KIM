class AddAttachmentSimToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :sim
    end
  end

  def self.down
    remove_attachment :kimms, :sim
  end
end
