# frozen_string_literal: true

require 'dry/monads'

##
# Module implementing tournament wizard by railway strategy within factory
module Wizard; end

require_relative './wizard/mixins/utils_helpers'

require_relative './wizard/mixins/success_monade_helpers'
require_relative './wizard/mixins/failure_monade_helpers'

require_relative './wizard/base_monades'
require_relative './wizard/division_monades'
require_relative './wizard/group_monades'
require_relative './wizard/game_monades'
require_relative './wizard/tournament_monades'
