class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer :lelang_id
      t.integer :barang_id
      t.integer :masyarakat_id
      t.integer :penawaran_harga

      t.timestamps
    end
  end
end
