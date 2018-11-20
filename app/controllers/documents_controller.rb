class DocumentsController < ApplicationController
before_action :authenticate_user!

  def index
  	@documents = current_user.documents
  end

  def new
  	@document = current_user.documents.build
  end

  def create

  	@document = current_user.documents.build(document_params)
    if @document.save

    else 
      

  end



  private


       def set_blog
      @document = Document.find(params[:id])
    end

      def document_params
      params.require(:document).permit(:soporte_estudios, :referencia_laboral, :fotocopia_cedula, :certificado_formacion, :certificado_cuenta_bancaria, :fondo_pension, :afiliacion_cesantias )
   end

end


