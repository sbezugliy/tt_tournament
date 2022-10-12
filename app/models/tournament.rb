# frozen_string_literal: true

class Tournament < ApplicationRecord
  DRAFT       = 1
  IN_PROGRESS = 2
  DONE        = 3

  STATUSES = {
    DRAFT => 'draft',
    IN_PROGRESS => 'in_progress',
    DONE => 'done'
  }.freeze

  validates :name, uniqueness: true
  validates :name, presence: true, allow_blank: false
  validates :status, inclusion: { in: STATUSES.keys,
                                  message: "must be one of: [ #{STATUSES.values.join ', '} ]" }

  def status_name
    STATUSES[status]
  end
end
