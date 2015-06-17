class AddMasaBerlakuKirSkidTankToKimms < ActiveRecord::Migration
  def change
  	add_column :kimms, :masa_berlaku_kir_skid_tank, :datetime, :default=>nil
  end
end
