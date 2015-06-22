class AddPicsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :pic_nama, :string
    add_column :users, :pic_telp, :string
  end
end
