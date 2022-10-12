# frozen_string_literal: true

class Division < ApplicationRecord
  belongs_to :tournament
  belongs_to :team
end
