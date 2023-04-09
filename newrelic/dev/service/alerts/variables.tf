variable "account_id" {
  default = "1234567"
}
# NewRelicのworkflowのNotifyで対象チャンネルを設定してからterraform planを実行すると値がわかる
variable "channelId" {
  default = "C00A1ABCD12"
}
