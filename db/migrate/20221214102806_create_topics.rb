class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.float :rating
      t.string :type

      t.timestamps
    end
  end
end
