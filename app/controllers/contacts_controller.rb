class ContactsController < ApplicationController
def new

	@title = "Werk - Contacto"
	@description = "Contáctanos para obtener más información sobre werk y su funcionamiento"
	@contact = Contact.new
end

def create
	@contact = Contact.new(params[:contact])	
	@contact.request = request
	if @contact.deliver
		redirect_to root_path, notice: "Se ha enviado tu mensaje a Werk exitosamente"
    else
      flash.now[:error] = "No se pudo enviar tu mensaje a Werk, por favor inténtalo más tarde"
      render :new
    end
end
end