class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :text, null:false
      t.string :image
      t.string :address ,null:false
      t.integer :user_id ,foreign_key:true
      t.integer :area_id ,foreign_key:true
      t.timestamps
    end
  end
end