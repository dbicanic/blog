class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :hometown
      t.text :introduction
      t.string :hobbies

      t.timestamps
    end
  end
end
