class AddChecklistToKimms < ActiveRecord::Migration
 
  def self.up
    change_table :kimms do |t|
      t.attachment :checklist
    end
  end

  def self.down
    remove_attachment :kimms, :checklist
  end
end
