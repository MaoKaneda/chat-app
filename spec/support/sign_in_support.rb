# このモジュールは、テストでユーザーログインを簡単に行うためのものです
module SignInSupport
  # sign_inメソッドは、テストの中でユーザーログインを行うための便利な機能です
  # 引数の'user'には、ログインしたいユーザーの情報が入っています
  def sign_in(user)
    # まず、ログインページにアクセスします
    # new_user_session_pathは、ログインページのURLを指します
    visit new_user_session_path

    # ログインフォームに、ユーザーのメールアドレスとパスワードを入力します
    # fill_inは、フォームに文字を入力するための命令です
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    # 「Log in」ボタンをクリックしてログインします
    # click_onは、ボタンをクリックする命令です
    click_on('Log in')

    # ログイン処理が完了するまで1秒待ちます
    # これは、ページの読み込みを待つためです
    sleep 1
  end
end

# このモジュールを全てのテストで使えるようにする設定です
RSpec.configure do |config|
  # SignInSupportモジュールを、全てのテストで使用できるようにします
  config.include SignInSupport
end