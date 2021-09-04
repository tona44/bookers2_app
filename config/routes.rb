Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only:[:index,:show,:edit,:update,:create]

  resources :books do  #ネストが好ましい
    resource :favorites, only: [:create,:destroy]
       #単数形にすると[/:id]のルートは生成されない（いいねにshowページ等不要の為）
    resources :book_comments, only: [:create,:destroy]
       #複数あるコメントの内、どのコメントを削除するかのコメント[/:id]が必要なので、複数形
  end

end
