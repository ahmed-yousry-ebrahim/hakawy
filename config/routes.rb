Rails.application.routes.draw do
  scope "(:locale)", locale: /ar|en/ do
    get 'pages/home'
    devise_for :users
    devise_scope :user do
      authenticated :user do
        root 'pages#home', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end
  end

end
