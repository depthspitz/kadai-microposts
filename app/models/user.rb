class User < ApplicationRecord
  before_save { self.email.downcase! } #大文字を小文字に変換する
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, #メルアドは文字や組み合わせが決まっているので、その通りに入力されているかチェック＝正規表現
                    uniqueness: { case_sensitive: false } #uniquenessは重複を許さない、{}内は大文字小文字を区別しないということ。
  has_secure_password
end
