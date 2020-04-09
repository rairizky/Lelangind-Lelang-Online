class Lelang < ApplicationRecord


    
    has_many :histories
    belongs_to :barang
end
