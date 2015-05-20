Spree::Core::Engine.routes.draw do
  namespace :chimpy, path: "" do
    resource :subscribers, only: [:create] do
      get 'success', :on => :collection
    end
  end

  namespace :admin do
    resource :chimpy_settings
  end
end
