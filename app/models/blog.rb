class Blog < ApplicationRecord
  belongs_to :user, optional: :true  
  validates :nombre, presence: true 
  validates :contenido, presence: true   
  
end
