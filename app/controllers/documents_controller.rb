class DocumentsController < ApplicationController
  def index
  	@documents = Document.all
  end

  def new
  	@document = Document.new
  end

  def create
  	@document = Document.new(document_params)
  	if @document.save
  		 flash[:notice] = "El documento ha sido subido exitosamente"
         redirect_to documents_path
      else
        flash[:alert] =  "No pudo ser creado el documento"
      end
  end

  def destroy
  	@document = Document.find(params[:id])
    @document.destroy
    flash[:notice] = "El documento fue borrado exitosamente"
    redirect_to documents_path
  end

  private
      def document_params
      params.require(:document).permit(:name, :document)
   end

end
