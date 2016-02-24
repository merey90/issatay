class CreatePresses < ActiveRecord::Migration
  
  def change
    create_table :presses do |t|
      t.string :title, index: true
      t.string :title_kz, index: true
      t.string :title_ru, index: true
      t.binary :body, index: true
      t.binary :body_kz, index: true
      t.binary :body_ru, index: true
      t.text :short_body, index: true
      t.text :short_body_kz, index: true
      t.text :short_body_ru, index: true
      t.string :url
      
      t.datetime :deleted_at, index: true
      
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
