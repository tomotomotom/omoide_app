Rails.application.routes.draw do
  root "posts#index"          # トップページは投稿一覧

  devise_for :users           # Deviseでユーザー認証機能（ログイン・ログアウト・登録）

  resources :posts            # 投稿のCRUD機能（一覧・詳細・新規・編集・削除）
end
