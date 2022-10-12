# frozen_string_literal: true

class CreateDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :divisions do |t|
      t.string :name, null: false
      t.references :tournament, foreign_key: true
      t.references :team, foreign_key: true
      t.string :type, null: false

      t.timestamps
    end

    add_index :divisions, :name, unique: true
  end
end
