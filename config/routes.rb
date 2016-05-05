Rails.application.routes.draw do
  resources :visitantes
  resources :contactos, only:  [:new,:create]
  #get '/visitantes/:id', to: 'visitantes#view', as: 'visitante'

  #resources :articulos
  #resources :categorias, :only=> [:new,:create]
  #resources :usuarios do	
  	#resources :articulos
  #end

 # namespace :administrador do
 # 	resources :articulos
 #	get 'usuarios/new','usuario/new'
 # end
 root to:'visitantes#index'
end
