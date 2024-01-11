class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :game, null: false, foreign_key: true
      t.string :game_review
      t.integer :score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
