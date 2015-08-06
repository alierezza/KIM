class AddReferenceToKimms < ActiveRecord::Migration
  def change
  	add_column :kimms, :reference, :string #reference crew
  end
end
