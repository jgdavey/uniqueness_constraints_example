Uniqueness::Application.routes.draw do
  resources :lists, except: :show do
    resources :items do
      collection do
        post :sort
      end
    end
  end
  root to: "lists#index"
end
