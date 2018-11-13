class ResumesController < ApplicationController
  def index
  	@resumes = Resume.all
  end

  def new
  	@resume = Resume.new
  end

  def create
  	@resume = Resume.new(resume_params)
  	if @resume.save
  		redirect_to resumes_path, notice: "El archivo ha sido subido"
  	else
  		render "new"
  end

end

  def destroy
  	@resume = Resume.find(params[:id])
  	@resume.destroy
  	redirect_to resumes_path, notice: "El archivo ha sido borrado"
  end

  private 
  	def resume_params
  	params.require(:resume).permit(:attachment)
  end
end
