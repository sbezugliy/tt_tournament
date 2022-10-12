# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :a_team
  belongs_to :b_team
end
