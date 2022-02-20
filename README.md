Snapask作業任務

以下為作業題目及需求：
請做一個簡單的線上課程平台，該平台提供的線上課程都是有時效性，一但過了時效性，使用者就必須重新購買，以再次取用該課程內容。

1. 需要有一個後台可以讓管理者管理教育課程。
  1. 可以執行CRUD基本操作 （完成）
  2. 若使用者不是管理員，則不允許操作 （完成） devise / cancancan / rolify
  3. 可以設定課程主題 （完成）
  4. 可以設定課程價格，幣別 （完成）
  5. 可以設定課程類型 （完成）
  6. 可以設定課程上下架 （完成）aasm
  7. 可以設定課程URL，以及描述
  8. 可以設定課程效期 1天 ~ 1個月 （完成） activejob / sidekiq

2. 這個平台可以讓用戶用API購買教育課程。
  1. 購買後須建立購買紀錄 （完成） grape / grape-entity
  2. 若課程已下架，則不能進行購買 （完成） grape / grape-entity / aasm
  3. 若使用者已購買過該課程，且目前還可以取用，則不允許重複購買 （完成）

3. 用戶可以用API瀏覽他所有購買過的課程
  1. 回傳結果要包含課程基本資料 （部分完成）
  2. 回傳結果要包含所有跟該課程相關的付款資料 （部分完成）
  3. 可以用過濾方式找出特定類型的課程
  4. 可以用過濾方式找出目前還可以上的課程

作業使用到devise / cancancan / rolify / sidekiq / grape / grape-entity / aasm 等Gemfile

由於權限設置並無經過介面，所以需要進入rails c中自行建立管理者(rolify)
