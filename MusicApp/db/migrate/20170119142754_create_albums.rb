class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :live_or_studio
      t.integer :band_id
      t.string :title

      t.timestamps null: false
    end
  end
end
