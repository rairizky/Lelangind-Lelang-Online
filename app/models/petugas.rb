class Petugas < ApplicationRecord

    validates :nama_petugas, presence: true, length: { minimum:4, maximum:20 }
    validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
    validates :level_id, presence: true, numericality: true

    has_secure_password
end
