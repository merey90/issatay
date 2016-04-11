class CreateStaticFields < ActiveRecord::Migration
  def change
    create_table :static_fields do |t|
      
      t.binary :biography, index: true
      t.binary :biography_kz, index: true
      t.binary :biography_ru, index: true
      
      t.binary :contacts, index: true
      t.binary :contacts_kz, index: true
      t.binary :contacts_ru, index: true
      
      t.timestamps null: false
    end
  end
end
