Rails.application.routes.draw do


	devise_for :administrators
	devise_for :users
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  	resources :blogs
  	resources :notifications, only: [:index]

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get "/recognition" => "recognitions#home", as: "recognition"
	get "/recognitions" => "recognitions#list", as: "index_recognitions"
	get "/texts" => "texts#list", as: "index_texts"
	get "/tones" => "tones#list", as: "index_tones"
	get "/diary" => "pages#problems", as: "my-diary"

	get "/education" => "pages#education", as: "education"


	post "/save_rec" => "recognitions#analyze_photo", as: "image_save"

	post "/translate_text" => "tones#traduce_text", as: "translate_text"
	post "/texts" => "texts#create", as: "texts"


	root to: "pages#home"

end