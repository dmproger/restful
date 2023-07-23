Rails.application.routes.draw do
  resources :servers do
    resources :bandwiths
  end
end
