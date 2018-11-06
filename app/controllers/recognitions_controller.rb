class RecognitionsController < ApplicationController
	before_action :authenticate_user!

	def list
		@recognitions = current_user.recognitions.order(created_at: :desc)
	end

	def analyze_photo
		visual_recognition = IBMWatson::VisualRecognitionV3.new(
		  version: "2018-03-19",
		  iam_apikey: "nsOM3ic0C_7ZmGwKlaEPC0KgJZVH2xbjVQkNa9Y-J8yY"
		)

		File.open(save_image(params[:image])) do |image_file|
  			face_result = visual_recognition.detect_faces(images_file: image_file).result
  			image = Recognition.new(:image => params[:image], :analisis => face_result, :user_id => current_user.id)

  			if image.save
				flash[:notice] = "Reconocimiento de imagen creado"
			else
				flash[:error] = "Error guardando la imagen"
			end
			redirect_to index_recognitions_path
		end
	end

	def save_image(str)
		location = Dir.getwd+'/public/images/'+rand(1...100000000).to_s+'.png'
		data = str
		File.open(location, 'wb') do |f|
  			f.write(Base64.decode64(data['data:image/png;base64,'.length .. -1]))
		end

		return location
	end

end