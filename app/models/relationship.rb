class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User' #Followという存在しないクラスを参照しようとしてエラーを起こすのを防ぐ
end
