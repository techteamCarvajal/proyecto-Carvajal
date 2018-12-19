class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
                     
		  validates :celular, :presence => {:message => ' no es valido el # de celular!'},
                     :numericality => true,
                     :length => { :minimum => 7, :maximum => 10 }
		  validates :nombres, presence: true
		  validates :apellidos, presence: true
  		validates :numero_documento,presence: true
      validates :tipo_documento,presence: true

      has_many :blogs, dependent: :destroy
      has_many :folders, dependent: :destroy
      
      mount_uploader :cv, AttachmentUploader # Tells rails to use this uploader for this model.
      belongs_to :city
      belongs_to :department
    
end
