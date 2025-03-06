module SignInSupport
  def sign_in(user)
    # サインインページへ移動する
    visit new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    # ログインボタンをクリックする
    click_on('Log in')
    sleep 1
  end
end

RSpec.configure do |config|
  config.include SignInSupport
end