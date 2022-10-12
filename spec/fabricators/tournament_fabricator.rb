# frozen_string_literal: true

Fabricator(:tournament) do
  name { Faker::Sports::Football.competition }
  status 1
end
