class CreateKabupatens < ActiveRecord::Migration
  def change
    create_table :kabupatens do |t|
    	t.string :nama
      t.timestamps null: false
    end
  end
end
