class FoldersController < ApplicationController
  
  before_action :set_folder, only: [:show, :edit, :destroy]
  before_action :authenticate_user!

  def index
    @folders = Folder.all
  end
 
  # muestra los documentos de cada candidato
  # GET /folders/1
  # GET /folders/1.json
  def show
    folder = Folder.find(params[:id])
   if current_user == folder.user 
    else
       flash[:alert] = "No puedes ver la carpeta laboral de otras personas"
       redirect_to  root_path
     end
  end


  # genera la etapa 1 de la carpeta laboral
  # GET /folders/new
  def new
   @folder = Folder.new
  end
  # POST /folders
  # POST /folders.json
  def create 
  
         @folder = current_user.folders.build
         @folder.user_id = current_user.id  
         @folder.save(validate: false) 
        redirect_to folder_step_path(@folder, Folder.form_steps.first)    
      

  end
  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    flash[:notice] = "Se ha borrado exitosamente."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:soporte_estudios, :referencia_laboral, :fotocopia_cedula, :certificado_formacion, :certificado_cuenta_bancaria, 
        :fondo_pension, :cesantias, :certificado_eps,:formato_domiciliaria, :formato_complemento,:conflicto_intereses,:oferta,:acepta_contrato,:arl, :radicacion_eps, :user_id)
    end
end
