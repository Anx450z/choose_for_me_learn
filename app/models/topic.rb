class Topic < ApplicationRecord
  has_many :rejections
  has_many :users, through: :rejections
  scope :movies, -> { where(type: 'Topic::Movie') }
  scope :foods, -> { where(type: 'Topic::Food') }
  scope :books, -> { where(type: 'Topic::Book') }
end
