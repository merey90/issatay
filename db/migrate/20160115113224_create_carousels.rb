class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      
      t.string :title, index: true
      t.string :title_kz, index: true
      t.string :title_ru, index: true
      t.text :description, index: true
      t.text :description_kz, index: true
      t.text :description_ru, index: true
      t.text :url
      
      t.datetime :deleted_at, index: true
      
      t.references :user, index: true, foreign_key: true
      
      t.string :picture

      t.timestamps null: false
    end
  end
end
