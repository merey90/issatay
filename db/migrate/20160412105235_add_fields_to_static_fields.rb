class AddFieldsToStaticFields < ActiveRecord::Migration
  def change
    add_column :static_fields, :about, :binary, index: true
    add_column :static_fields, :about_kz, :binary, index: true
    add_column :static_fields, :about_ru, :binary, index: true
    add_column :static_fields, :home, :binary, index: true
    add_column :static_fields, :home_kz, :binary, index: true
    add_column :static_fields, :home_ru, :binary, index: true
    add_column :static_fields, :help, :binary, index: true
    add_column :static_fields, :help_kz, :binary, index: true
    add_column :static_fields, :help_ru, :binary, index: true
  end
end
