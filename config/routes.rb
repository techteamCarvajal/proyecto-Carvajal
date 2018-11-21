Rails.application.routes.draw do

    resources :folders
   	devise_for :companies, controllers: { sessions: 'companies/sessions' , registrations: 'companies/registrations' } 
	devise_for :administrators 
	devise_for :users
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  	resources :offers
  	resources :after_signup
  	resources :blogs
  	resources :notifications, only: [:index]
  	resources :contacts, only: [:new, :create]
 	resources :documents

  	

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/recognition" => "recognitions#home", as: "recognition"
	get "/recognitions" => "recognitions#list", as: "index_recognitions"
	get "/texts" => "texts#list", as: "index_texts"
	get "/tones" => "tones#list", as: "index_tones"
	get "/diary" => "pages#problems", as: "my-diary"


	get "/profile" => "pages#profile", as: "carpeta_laboral"
	get "/education" => "pages#education", as: "education"
	get "/test" => "pages#test", as: "test"
	get "/terminos_condiciones" => "pages#terminos_condiciones", as: "terminos_condiciones"
	get "/politicas" => "pages#politicas", as: "politicas"
	get "/nosotros" => "pages#us", as: "nosotros"
	get "/works" => "pages#works", as: "como_funciona_empresa"
	get "/works_candidato" => "pages#works_candidato", as: "como_funciona_candidato"
	get "/faq" => "pages#faq", as: "faq_empresa"
	get "/faq_candidato" => "pages#faq_candidato", as: "faq_candidato"

	post "/save_rec" => "recognitions#analyze_photo", as: "image_save"

	post "/translate_text" => "tones#traduce_text", as: "translate_text"
	post "/texts" => "texts#create", as: "texts"


	root to: "pages#home"

	

end
