## start_at_should_be_before_end_atメソッド  
<br>

- 終了の日時より開始の日時が未来になる場合にバリデーションでエラーを伝えるメソッド  
```rb
#モデルファイル
validates :start_at_should_be_before_end_at

  private

  def start_at_should_be_before_end_at
    #nilチェック
    #start_atカラムとend_atカラムのどちらかのデータがなければ(nil)、このメソッドを抜ける
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end
```