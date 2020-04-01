class CreatePetugas < ActiveRecord::Migration[6.0]
  def change
    create_table :petugas do |t|
      t.string :nama_petugas, limit: 25
      t.string :username, limit: 25
      t.string :password_digest
      t.integer :level_id

      t.timestamps
    end
    
    Petugas.create! do |p|
      p.nama_petugas = "admin"
      p.username = "admin1"
      p.password = "admin123"
      p.level_id = 1
    end
  end
end
