class AddRefile < ActiveRecord::Migration
  def change
    add_column :authors, :photo_id, :string
    add_column :books, :photo_id, :string
    remove_column :authors, :photo_url, :string
    remove_column :books, :photo_url, :string
  end
end
