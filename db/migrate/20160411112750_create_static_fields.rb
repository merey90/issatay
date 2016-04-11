class CreateStaticFields < ActiveRecord::Migration
  def change
    create_table :static_fields do |t|

      t.timestamps null: false
    end
  end
end
