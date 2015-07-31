class AddStatusToKimms < ActiveRecord::Migration
  def change
  	add_column :kimms, :status, :boolean, :default=>true #block or not blocked
  end
end
