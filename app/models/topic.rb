class Topic < ApplicationRecord
  has_and_belongs_to_many :users
  scope :movies, -> { where(type: 'Topic::Movie') }
  scope :foods, -> { where(type: 'Topic::Food') }
  scope :books, -> { where(type: 'Topic::Book') }
end
