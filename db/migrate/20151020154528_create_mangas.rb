class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :name, null: false
      t.string :cover_url
      t.text :description
      t.boolean :active, default: true
      t.integer :releases_count
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
