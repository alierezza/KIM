class AddBestToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :best, :boolean, :default=>false #status best of the month
  end
end
