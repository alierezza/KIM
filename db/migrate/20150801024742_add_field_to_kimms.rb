class AddFieldToKimms < ActiveRecord::Migration
  def change
  		add_column :kimms, :no_sim, :string
  		add_column :kimms, :no_stnk, :string
  		add_column :kimms, :no_ktp, :string
  end
end
