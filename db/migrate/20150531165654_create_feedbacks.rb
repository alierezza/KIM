class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.integer :q1, :default=>0
    	t.integer :q2, :default=>0
    	t.integer :q3, :default=>0
    	t.integer :q4, :default=>0
    	t.integer :q5, :default=>0
    	t.integer :q6, :default=>0
    	t.integer :q7, :default=>0
    	t.integer :q8, :default=>0
    	t.integer :q9, :default=>0
    	t.integer :q10, :default=>0

      t.timestamps null: false
    end
  end
end
