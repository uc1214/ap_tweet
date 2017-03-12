class CreateYstweets < ActiveRecord::Migration
  def change
    create_table :ystweets do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
