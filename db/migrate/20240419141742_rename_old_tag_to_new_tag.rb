class RenameOldTagToNewTag < ActiveRecord::Migration[6.1]
  def change
    Tag.where(name: "テイクアウト可能").update_all(name: "テイクアウトOK")
    Tag.where(name: "モーニング").update_all(name: "モーニングメニューあり")
    Tag.where(name: "ランチ").update_all(name: "ランチメニューあり")
    Tag.where(name: "電子マネー対応").update_all(name: "電子マネーOK")
    Tag.create(name: "クレジットOK")
  end
end
