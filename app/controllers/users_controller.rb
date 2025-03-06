# ユーザー情報を管理するコントローラーです
# ユーザー情報の編集や更新などの機能を提供します
class UsersController < ApplicationController

  # ユーザー情報を編集するためのフォームを表示します
  def edit
  end

  # ユーザー情報を更新します
  # 更新が成功したら一覧ページに戻り、失敗したら編集フォームを再表示します
  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  # ユーザー情報更新時に許可するパラメータを設定します
  # ユーザー名とメールアドレスを更新できます
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
