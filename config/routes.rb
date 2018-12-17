Rails.application.routes.draw do

	devise_for :companies, controllers: { sessions: 'companies/sessions' , registrations: 'companies/registrations' } 
	devise_for :administrators 
	devise_for :users
	mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	
	resources :folders, only: [:new, :create, :show, :index] do
	resources :steps, only: [:show, :update], controller: 'folder/steps'
	end

   
	
  	resources :offers
  	resources :blogs
  	resources :contacts, only: [:new, :create]
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
	root to: "pages#home"

end
