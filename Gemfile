source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 5.2.4'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

# ログイン機能
gem 'devise'

# 日本語化
gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'

# Bootstrap
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
# ログイン関連ページにBootstrapを適用するGem
gem 'devise-bootstrap-views', '~> 1.0'

# Chart.js（グラフ表示）
gem 'chart-js-rails'
# flatpickr（カレンダー）
gem 'flatpickr'
# Gon（コントローラから Javascript に変数を渡せるようにする）
gem 'gon'
# Autoprefixer doesn't support Node v13 11.0 Update itエラー解消のため
gem 'mini_racer'
# 検索
gem 'ransack'
# 管理者画面
gem 'activeadmin'
# 画像投稿機能
gem 'carrierwave', '~> 2.0'
# 画像ファイル加工
gem 'mini_magick'
# Font Awesomeを使うため
gem 'font-awesome-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Rails用のテストフレームワーク
  gem 'rspec-rails'
  # モデルに関するテストデータ作成用
  gem 'factory_bot_rails'
  # ダミーデータの生成
  gem 'faker'
  # デバッグ用
  gem 'pry-byebug'
  gem 'pry-doc'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
