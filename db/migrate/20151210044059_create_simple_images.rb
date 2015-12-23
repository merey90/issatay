class CreateSimpleImages < ActiveRecord::Migration
  def change
    create_table :simple_images do |t|
      t.string :picture
      t.string :title, index: true
      t.string :title_kz, index: true
      t.string :title_ru, index: true
      t.text :description, index: true
      t.text :description_kz, index: true
      t.text :description_ru, index: true
      
      t.references :imageable, polymorphic:true, index: true

      t.timestamps null: false
    end
  end
end
