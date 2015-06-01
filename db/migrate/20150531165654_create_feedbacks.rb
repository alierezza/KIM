class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.float :q1, :default=>0
    	t.float :q2, :default=>0
    	t.float :q3, :default=>0
    	t.float :q4, :default=>0
    	t.float :q5, :default=>0
    	t.float :q6, :default=>0
    	t.float :q7, :default=>0
    	t.float :q8, :default=>0
    	t.float :q9, :default=>0
    	t.float :q10, :default=>0

      t.timestamps null: false
    end
  end
end
