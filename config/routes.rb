Rails.application.routes.draw do
  root 'boards#index'

  resources :boards do
    resources :artists
  end

  scope 'artists/artist_id', as: 'artist' do
    resources :songs
  end
end
