# frozen_string_literal: true

Fabricator(:team) do
  name { Faker::Lorem.unique.words(number: 3).join(' ').capitalize }
end
