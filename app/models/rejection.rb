class Rejection < ApplicationRecord
  self.table_name = "topics_users"

  belongs_to :topic
  belongs_to :user
  
end