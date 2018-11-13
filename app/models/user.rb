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
      has_many :texts, dependent: :destroy
      has_many :recordings, dependent: :destroy
      has_many :recognitions, dependent: :destroy

      mount_uploader :attachment, AttachmentUploader 
    
end
