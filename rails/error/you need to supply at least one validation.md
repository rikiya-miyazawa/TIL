## You need to supply at least one validationエラー
<br>

- validatesの記述の仕方で発生するエラー  
```rb
#app/models/event.rb
#自作のメソッドはvalidateにしないと上記のエラーが発生する
class Event < ApplicationRecord
  validates :name, length: { maximum: 50 }, presence: true
  validates :place, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 2000 }, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  #validates :start_at_should_be_before_end_at の記述でエラー発生
  validate :start_at_should_be_before_end_at

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了時間よりも前に設定してください")
    end
  end
end

```