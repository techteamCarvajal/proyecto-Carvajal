class FoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  def index
    @folders = Folder.all
  end
 
  # muestra los documentos de cada candidato
  # GET /folders/1
  # GET /folders/1.json
  def show
    folder = Folder.find(params[:id])
   if current_user == folder.user # si mi usuario es el mismo del anuncio valida que no haga una reserva propia
    else
       flash[:alert] = "No puedes ver la carpeta laboral de otras personas"
       redirect_to  root_path
     end
  end


  # genera la etapa 1 de la carpeta laboral
  # GET /folders/new
  def new
    if current_user.folders.count == 0
      @folder = current_user.folders.build
    else
      flash[:alert] =  "Sólo puedes crear la etapa 1 una vez."
      redirect_to root_path
    end
  end

 
  # POST /folders
  # POST /folders.json
  def create
    if Folder.count > 0
      @folder.order = Folder.maximum(:order) + 1
    else 
      @folder.order = 1
    end
    @folder = Folder.new(folder_params)
    @folder.user_id = current_user.id  
      if @folder.save
        flash[:notice] = "Etapa 1 creada exitosamente."
        redirect_to root_path
      else
       flash[:notice] = "La etapa 1 no pudo ser creada"
       redirect_to root_path    
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:soporte_estudios, :referencia_laboral, :fotocopia_cedula, :certificado_formacion, :certificado_cuenta_bancaria, :fondo_pension, :cesantias, :certificado_eps, :user_id)
    end
end
