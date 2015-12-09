class CreatePresses < ActiveRecord::Migration
  
  def change
    create_table :presses do |t|
      t.string :title, index: true
      t.string :title_kz, index: true
      t.string :title_ru, index: true
      t.text :body, index: true
      t.text :body_kz, index: true
      t.text :body_ru, index: true
      t.string :short_body, index: true
      t.string :short_body_kz, index: true
      t.string :short_body_ru, index: true
      t.text :url
      
      t.text :image1
      t.text :image2
      t.text :image3
      t.text :image4
      t.text :image5
      t.text :image6
      t.text :image7
      
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
