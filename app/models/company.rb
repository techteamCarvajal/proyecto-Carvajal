class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   	validates :nombres, presence: true
	validates :apellidos, presence: true
  	validates :numero_documento,presence: true
    validates :tipo_documento,presence: true

end
