Spina::Engine.routes.draw do
  # Backend
  namespace :admin, path: Spina.config.backend_path do
    # Mounts
    resources :mounts
  end
end
