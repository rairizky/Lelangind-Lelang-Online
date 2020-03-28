class CreateMasyarakats < ActiveRecord::Migration[6.0]
  def change
    create_table :masyarakats do |t|
      t.string :nama_lengkap, limit: 25
      t.string :username, limit: 25
      t.string :password_digest
      t.string :telp, limit: 25

      t.timestamps
    end
  end
end
