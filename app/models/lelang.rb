class Lelang < ApplicationRecord


    belongs_to :masyarakat
    has_many :histories
    belongs_to :barang
end
