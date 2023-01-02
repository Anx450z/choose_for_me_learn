# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rejections
  has_many :topics, through: :rejections, dependent: :destroy

  # has_many :movies, class_name: 'Topic::Movie', dependent: :destroy, join_table: 'topics_users', association_foreign_key: 'topic_id'
  # has_many :foods, class_name: 'Topic::Food', dependent: :destroy, join_table: 'topics_users', association_foreign_key: 'topic_id'
  # has_many :books, through , class_name: 'Topic::Book', dependent: :destroy, join_table: 'topics_users', association_foreign_key: 'topic_id' 

  def randomize(type) 
    all_options = Topic.where(type:).all
    rejected_options = self.topics.where(type:).to_a
    options = all_options.excluding(rejected_options)
    if options.any?
      @option = options.min_by { rand }
      self.topics << @option
      self.save
      @option
    else
      @option = Topic.where(type:).first
      self.rejections.where(topic_id: [options.ids]).delete_all
    end
  end
end
