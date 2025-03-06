# アプリケーションの全てのコントローラーの親クラスです
# このファイルで設定した内容は、全てのコントローラーに適用されます
class ApplicationController < ActionController::Base
  # ユーザーがログインしていない場合、ログインページにリダイレクトします
  before_action :authenticate_user!
  
  # Devise（ユーザー認証機能）のコントローラーの場合のみ実行されます
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # ユーザー登録時に許可するパラメータを設定します
  # ここでは、ユーザー名（name）を登録時に保存できるようにしています
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
