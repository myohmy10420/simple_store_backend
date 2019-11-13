## 參考環境
ruby 2.4.4

## 使用說明

clone專案下來之後

`$ bundle install`

`$ rake db:create db:migrate`

安裝[puma-dev](https://github.com/puma/puma-dev)使用 simple_store_api.test 網址開啟 server

安裝完 puma-dev 之後下以下指令

`$ echo 3001 > ~/.puma-dev/simple_store_api`

此專案預設 3001 port，也可以自己設定

開啟 puma

`$ puma-dev`

網站輸入網址`simple_store_api.test`看到 rails 預設頁面代表成功

## 內容說明

products(商品) api，注意 amount 是數量，inventory 是庫存，price 是價格

orders(訂單) api

line_items(訂單項目) api

成立訂單後會扣除商品庫存，並且打開預覽 email 頁面

mailer 的設定 development 與 production 預設都先用 letter-open 開啟，如要用真正第三方服務請至 environments/production.rb 最底下開啟並填入設定

目前驗證都在後端做並傳到前端顯示 alert
