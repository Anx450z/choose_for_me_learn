# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :topics, dependent: :destroy
  def randomize(type)
    all_options = Topic.where(type:).all
    rejected_options = self.topics.where(type:).to_a
    options = all_options.excluding(rejected_options)
    if options.any?
      @option = options.min_by { rand }
      rejected_options << @option
      save
      @option
    else
      rejected_options.delete_all
      @option = topics.first
    end
  end
end
