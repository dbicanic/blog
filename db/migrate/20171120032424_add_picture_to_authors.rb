class AddPictureToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :picture, :longblob
  end
end
