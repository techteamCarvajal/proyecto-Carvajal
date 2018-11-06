class TonesController < ApplicationController
	before_action :authenticate_user!

	def list
		@recordings = current_user.recordings.order(created_at: :desc)
	end

	def home
	end

	def traduce_text
		language_translator = IBMWatson::LanguageTranslatorV3.new(
		  version: "2018-05-31",
		  iam_apikey: "5k0X9c7kGmm4ZWKbXrtaAZmpXnvB6Ggnhcra6PiXmZpg"
		)

		translation = language_translator.translate(
		  text: params[:text],
		  model_id: "es-en"
		).result

		translated_text = translation.as_json

		return analyze_text(translated_text["translations"][0]["translation"], params[:text])
	end

	def analyze_text(text, text_sp)
		tone_analyzer = IBMWatson::ToneAnalyzerV3.new(
		  iam_apikey: "UKvofwPw61qipa9Y7bnwcKbQ4iTyM1SwVAu9g4qdhgP_",
		  version: "2017-09-21"
		)

		utterances = [
			{
			    "text" => text,
				"user" => "Maria"
			}
		]

		if tone_analyzer.tone_chat(utterances: utterances).result
			json = tone_analyzer.tone_chat(utterances: utterances).result.as_json
			emocion = json["utterances_tone"][0]["tones"][0]["tone_id"]

			emocion_sp = get_status(emocion)[1]
			status = get_status(emocion)[0]

			recording = current_user.recordings.new(:texto => text_sp, :emocion => emocion_sp, :status => status.to_i)
			
			if recording.save
				flash[:notice] = "Grabación creada satisfactoriamente"
			else
				flash[:error] = "Hubo un errorguardando la grabación, inténtalo más tarde"
			end
		else 
			flash[:error] = "No se detectó ninguna emoción dentro del texto"
		end
		redirect_to index_tones_path
	end

	def get_status(emocion)
		status = 2
		case emocion
        when "joy"
            emotion = "divertido"
            status = 1
        when "fear"
            emotion = "miedo"
            status = 0
        when "sadness"
            emotion = "tristeza"
            status = 0
        when "anger"
            emotion = "rabia"
            status = 0 
        when "analytical"
            emotion = "analítico"
            status = 1
        when "confident"
            emotion = "confiado"
            status = 1
        when "frustrated"
            emotion = "frustrado"
            status = 0
        when "polite"
            emotion = "cortés"
            status = 1
        when "excited"
            emotion = "exitado"
            status = 1
        when "impolite"
        	emotion = "descortés"
        	status = 0
		else
		  	emotion = ""
		  	status = ""
		end
		return [status, emotion]
	end
end