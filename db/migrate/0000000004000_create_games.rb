# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :a_team, foreign_key: { to_table: 'teams' }
      t.references :b_team, foreign_key: { to_table: 'teams' }
      t.integer :score_a
      t.integer :score_b

      t.timestamps
    end
  end
end
