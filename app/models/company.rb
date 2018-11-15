class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nombre, presence: true
    validates :rut, presence: true
  	validates :telefono,presence: true
    validates :direccion,presence: true
    validates :nit,presence: true

    has_many :offers
end
