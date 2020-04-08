class Masyarakat < ApplicationRecord
    
    validates :nama_lengkap, presence: true, length: { minimum: 4 }
    validates :username, uniqueness: true, presence: true, length: { minimum: 5, maximum: 20 }
    validates :password, presence: true, length: { minimum: 6, maximum: 20 }
    validates :telp, presence: true, uniqueness: true, length: { minimum: 9, maximum: 15 }, numericality: true

    has_one :lelang
    has_many :histories
    has_secure_password
end
