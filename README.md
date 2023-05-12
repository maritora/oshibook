# README

## OSHIBOOK

URL：https://oshibook.fly.dev/  
自分の推しを紹介できるサイトです。
好きなアイドルや歌手・芸能人・スポーツ選手などあなたの推しのプロフィールを作成し、推しの好きなところを存分にアピールできます！

### なぜ作ったのか
昨今の推し活ブームや私自身、推しの存在で元気をもらっており、昔流行ったプロフィール帳形式で推しを紹介・良さを共有できる楽しいツールがあったらな。。。と思い、制作いたしました。
### デモ画像
<img width="990" alt="OSHIBOOK_sample01" src="https://github.com/maritora/oshibook/assets/102473459/2038205d-58d0-4e96-a618-9a91f4eabe68">
<img width="990" alt="OSHIBOOK_sample02" src="https://github.com/maritora/oshibook/assets/102473459/65537365-6e17-4dce-87ba-7cbc8e8b9fe4">

### こだわりポイント
* 作成時、推しのイメージカラーが選べる
* 詳細画面から手軽にTwitter共有ボタンでプロフィールを共有できる
* 作成履歴・いいね履歴からプロフィール管理できる

### 使用技術
* Ruby 2.7.6
* Ruby on Rails 6.1.7
* PostgreSQL 14.7
* Docker
* RSpec
* fly.io

### 機能一覧
* ユーザー登録、ログイン/ゲストログイン機能(devise)
* 投稿機能
    * 画像投稿(Active Storage)
    * カラー選択
    * 公開・非公開機能
* 検索機能(ransack)
* いいね機能(Ajax)

### テスト
* RSpec
    * 単体テスト(model)
    * 機能テスト(system)
