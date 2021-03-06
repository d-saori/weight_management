# 体重管理アプリ
- 体重を記録できるアプリです
<br>

# アプリ概要
- 体重を入力する事によってグラフで数値の推移を視覚的に表示してくれます。
- 記録は当日から過去3ヶ月まで遡る事ができ、1週間単位、2週間単位、1ヶ月単位、3ヶ月単位での表示が可能です。
- heroku：https://weight-management100.herokuapp.com/
<br>

# 使い方
1. 画面上部の「新規登録」ボタンよりユーザ登録<br>
__※ 閲覧用のゲストログイン機能も実装しております。(画面上部の「ゲストログイン(閲覧用)」をご使用ください。)__
2. 「新規記録」ボタンより摂取カロリーや消費カロリー、本日の体重を投稿
3. 投稿されたデータがグラフで表示される
<br>

# インストール
```
$ git clone https://github.com/d-saori/weight_management.git
$ cd weight_management
$ bundle install
```
<br>

# 開発環境
- Ruby 2.6.6
- Rails 5.2.4
- PostgreSQL 13.2
- Bootstrap
- Sass
- JavaScript 
<br>

# 機能一覧
- ログイン機能、新規登録(Devise)
- ゲストログイン機能
- 管理者画面(ActiveAdmin)
- カレンダー機能(flatpickr)
- グラフ機能(Chart.js)
- 画像投稿機能(CarrierWave,imagemagick)
- RSpecを使用したテストコードの実装(随時拡充中)

<br>

__【今後追加予定機能】__ <br>
- AWSデプロイ
- ユーザー検索機能(Ransackを使用）
- 体重以外の数値(体脂肪、摂取カロリー、消化エネルギー)記録機能
- ユーザーの詳細ページの充実(日記機能を追加し毎日の食事の記録も行えるようにする、登録しているSNSリンクを貼れる等)
- 登録ユーザー同士の交流機能(ユーザー同士フォローできる、日記にいいねができる等)
<br>

# ライセンス
This project is licensed free.<br>
ご自由にご利用ください
