Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  get 'restaurants/about' => 'restaurants#about'
  get 'restaurants/:restaurant_id/bookmarks' => 'bookmarks#create'
  get 'restaurants/:restaurant_id/bookmarks/:id' => 'bookmarks#destroy'
  get 'restaurants/:restaurant_id/comments/:id' => 'comments#destroy'
  resources :restaurants do
    resources :bookmarks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  root 'restaurants#index'
end
