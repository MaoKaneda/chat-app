# このファイルは、テストを実行するために必要な設定を行うファイルです
# テストの基本的な設定を読み込みます
require 'spec_helper'

# テスト環境を設定します。設定されていない場合は'test'を使用します
ENV['RAILS_ENV'] ||= 'test'

# Railsアプリケーションの環境設定を読み込みます
require_relative '../config/environment'

# もし本番環境で実行しようとした場合は、エラーを表示して停止します
abort("The Rails environment is running in production mode!") if Rails.env.production?

# RSpecとRailsを連携させるためのファイルを読み込みます
require 'rspec/rails'

# ここから下に、追加の設定を書くことができます
# Railsの読み込みは、この時点で完了しています

# spec/supportディレクトリにある全てのファイルを読み込みます
# これにより、テストのサポート機能（ヘルパーなど）が使えるようになります
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# データベースのマイグレーション（テーブルの作成など）をチェックします
# もしマイグレーションが実行されていない場合は、エラーを表示します
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

# テストの表示を英語にします
I18n.locale = "en"

# RSpecの詳細な設定を行います
RSpec.configure do |config|
  # SignInSupportモジュールを全てのテストで使えるようにします
  # これにより、ログインのテストが簡単にできるようになります
  config.include SignInSupport

  # テスト用のデータを置く場所を指定します
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # テストの中でデータベースを使う時の設定です
  # trueにすると、テストごとにデータベースがリセットされます
  config.use_transactional_fixtures = true

  config.filter_rails_from_backtrace!
end
