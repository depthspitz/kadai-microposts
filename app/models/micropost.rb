class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :farovites
  has_many :likeds, through: :favorites, source: :user
end
