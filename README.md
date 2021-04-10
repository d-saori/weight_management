# 体重管理アプリ
- 体重を記録できるアプリです
<br>

# アプリ概要
- 体重を入力する事によってグラフで数値の推移を視覚的に表示してくれます。
- 記録は当日から過去3ヶ月まで遡る事ができ、1週間単位、2週間単位、1ヶ月単位、3ヶ月単位での表示が可能です。
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
- カレンダー機能(flatpickr)
- グラフ機能(Chart.js)

<br>

__【今後追加予定機能】__ <br>
- ユーザー毎の詳細ページ追加(身長、体脂肪、現在体重、目標体重)
- 画像投稿機能(ユーザー詳細ページに全身写真を投稿し現在の体型と見比べモチベーション維持に繋げる)
- 体脂肪記録機能
- BMI計算機能
- 運動カロリー記録機能
- 体重情報を元に検索機能を実装(Ransackを使用）
- RSpecを使用したテストコードの実装
<br>

# ライセンス
This project is licensed free.<br>
ご自由にご利用ください
