class CreateLikables < ActiveRecord::Migration[6.0]
  def change
    create_table :likables do |t|
      t.integer :thumbsup
      t.integer :laugh
      t.integer :wow
      t.integer :dislike
      t.integer :anger

      t.timestamps
    end
  end
end
