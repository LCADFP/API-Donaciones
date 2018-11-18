Rails.application.routes.draw do

    root 'home#index'  

    resources :users
    post 'user_token' => 'user_token#create'      
    get '/:token/confirm_email/', :to => "users#confirm_email", as: 'confirm_email' 

    resources :password_resets 

    resources :donacions
end
