class TextsController < ApplicationController
	before_action :authenticate_user!

	def list
		@texts = current_user.texts.order(created_at: :desc)
		@text = current_user.texts.new
	end

	def create
		variables = traduce_text(params[:text][:texto])
		texto = current_user.texts.new(:texto => variables[0],
							   :emocion => variables[1],
							   :status => variables[2])

		if texto.save
			flash[:notice] = "Texto creado satisfactoriamente"
		else
			flash[:error] = "Hubo un error creando el texto, inténtalo más tarde"
		end
		redirect_to index_texts_path
	end

	def traduce_text(text)
		language_translator = IBMWatson::LanguageTranslatorV3.new(
		  version: "2018-05-31",
		  iam_apikey: "5k0X9c7kGmm4ZWKbXrtaAZmpXnvB6Ggnhcra6PiXmZpg"
		)

		translation = language_translator.translate(
		  text: text,
		  model_id: "es-en"
		).result

		translated_text = translation.as_json

		return analyze_text(translated_text["translations"][0]["translation"], text)
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

			current_user.texts.create(:texto => text_sp, :emocion => emocion_sp, :status => status.to_i)
		end

		return [text_sp, emocion_sp, status.to_i]
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