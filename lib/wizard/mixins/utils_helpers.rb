# frozen_string_literal: true

module Wizard
  # Module with utilitary mixins
  module UtilsHelpers
    private

    def make_goals
      rand(6)
    end
  end
end

##
# Extending class array with utilitary methods
class Array
  include ::Wizard::UtilsHelpers

  ERRORMSG = {
    incorrect_multiplicity:
    'Incorrect multiplicity of array size and number of slices'
  }.freeze
  def divide_array(number_of_slices = 2)
    raise ERRORMSG[:incorrect_multiplicity] unless (size % number_of_slices).zero?

    each_slice(size / number_of_slices).to_a
  end

  def sort_by_score
    sort { |team_a, team_b| team_b[1] <=> team_a[1] }
  end

  # TODO: Optimize these operations with arrays
  def best_with_worst
    result = []
    arr = divide_array
    arr[1] = arr[1].reverse
    arr[0].length.times do |index|
      result << [arr[0][index], arr[1][index]]
    end
    result
  end
end
