class CreateBarangs < ActiveRecord::Migration[6.0]
  def change
    create_table :barangs do |t|
      t.string :nama_barang, limit: 25, null: false
      t.string :img_barang, null: false
      t.date :tgl, null: false
      t.integer :harga_awal, null: false
      t.text :deskripsi_barang, null: false

      t.timestamps
    end
  end
end
