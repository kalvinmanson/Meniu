Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }
	
	#Web routes
	root to: "web#index"
	get '/places/my', to: 'places#my'
	#get '/:place_id/charts', to: 'places#charts'
	get '/how-it-works', to: 'web#how'
	get '/set_location', to: 'web#set_location'
	resources :places do
		get 'charts'
	  resources :plates do
	  	resources :visits
	  end
	end
	resources :users
	
	namespace :admin do
		resources :apps
		resources :cities
		resources :users
		resources :tokens
		resources :visits
		resources :quests
		resources :plates
		resources :places
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Api routes
  namespace :api, default: { format: "json" } do
  	namespace :v1 do
		resources :users, except: [:new, :edit]
		resources :visits, except: [:new, :edit]
		resources :plates, except: [:new, :edit]
		resources :places, except: [:new, :edit]
  	end
  end
end
