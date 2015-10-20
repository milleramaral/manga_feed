class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :link
      t.string :chapter
      t.integer :manga_id

      t.timestamps null: false
    end
  end
end
