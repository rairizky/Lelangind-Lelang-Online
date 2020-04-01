class Barang < ApplicationRecord

    validates :nama_barang, presence: true, length: { minimum: 4, maximum: 25 }
    validates :tgl, presence: true 
    validates :img_barang, presence: true
    validates :harga_awal, presence: true, numericality: true
    validates :deskripsi_barang, presence: true, length: { minimum: 5 }
    mount_uploader :img_barang, BarangUploader

end
