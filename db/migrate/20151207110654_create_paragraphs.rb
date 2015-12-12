class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.string :title, index: true
      t.string :title_kz, index: true
      t.string :title_ru, index: true
      t.binary :body, index: true
      t.binary :body_kz, index: true
      t.binary :body_ru, index: true
      
      t.string :image
      
      t.references :paragraphable, polymorphic: true, index: true
      
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
