class Petugas < ApplicationRecord

    validates :nama_petugas, presence: true, length: { minimum:4, maximum:20 }
    validates :username, presence: true, uniqueness: true, length: { minimum: 5, maximum: 20 }
    validates :password, presence: true, length: { minimum: 6, maximum: 20 }
    validates :password_confirmation, presence: true
    validates :level_id, presence: true, numericality: true

    has_one :level

    has_secure_password
end
