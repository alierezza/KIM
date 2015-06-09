class AddAttachmentKirSkidTankToKimms < ActiveRecord::Migration
  def self.up
    change_table :kimms do |t|
      t.attachment :kir_skid_tank
    end
  end

  def self.down
    remove_attachment :kimms, :kir_skid_tank
  end
end
