# frozen_string_literal: true

class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 1
      t.timestamps
    end

    add_index :tournaments, :name, unique: true
  end
end
