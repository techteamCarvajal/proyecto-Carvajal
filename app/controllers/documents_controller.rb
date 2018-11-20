class DocumentsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
  	@resumes = Resume.all
  end

  def new
  	@resume = Resume.new
  end

  def create

  	@document = Document.new(document_params)
    @document.user_id = document_user.id

    respond_to do |format|
      if @document.save
        format.html { redirect_to blogs_path, notice: ' Carpeta de documentos creada exitosamente.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end


  end



  private


       def set_blog
      @document = Document.find(params[:id])
    end

      def resume_params
      params.require(:document).permit(:soporte_estudios, :referencia_laboral, :fotocopia_cedula, :certificado_formacion, :certificado_cuenta_bancaria, :fondo_pension, :afiliacion_cesantias )
   end
end


