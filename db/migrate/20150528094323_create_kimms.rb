class CreateKimms < ActiveRecord::Migration
  def change
    create_table :kimms do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
