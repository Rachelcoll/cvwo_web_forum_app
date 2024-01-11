class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :release_date
      t.string :developers
      t.string :genre

      t.timestamps
    end
  end
end
