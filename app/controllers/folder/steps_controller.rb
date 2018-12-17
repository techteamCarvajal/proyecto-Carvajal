class Folder::StepsController < ApplicationController
	include Wicked::Wizard
  	steps *Folder.form_steps

  def show
  	 @folder = Folder.find(params[:folder_id])
     render_wizard
  end

  def update
    @folder = Folder.find(params[:folder_id])
    @folder.update(folder_params(step))
    render_wizard @folder
  end

 private

  def folder_params(step)
    permitted_attributes = case step
                           when "etapa1"
                             [:referencia_laboral, :soporte_estudios,:fotocopia_cedula, :certificado_formacion]
                           when "etapa2"
                             [:fotocopia_cedula, :certificado_formacion]
                           end

    params.require(:folder).permit(permitted_attributes).merge(form_step: step)
  end

end
