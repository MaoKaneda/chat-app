Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end

＃Maddieの解説
#routes.rbについては、devise_for :usersが追加されている。
#自分で「  devise_for :users」記述することはない→deviseをインストールすると自動で追加されるため
#