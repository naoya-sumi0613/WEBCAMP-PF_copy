Rails.application.routes.draw do

  root 'users/homes#top'
  devise_for :admins


  scope module: :users do
  	devise_for :users, controllers: {
  		sessions: 'users/sessions',
  		registrations: 'users/registrations',
  		passwords: 'users/passwords'
  	}
    resources :users, only: [:show, :edit, :update, :destroy] do
      get :retire, on: :member
    end
    get 'homes/about'
    resource :contacts, only: [:new, :create]
    get 'contacts/done' => "contacts#done"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
