# frozen_string_literal: true

class County < ApplicationRecord
  include FilteredResponse

  default_scope -> { order(:date) }

  class << self
    include ::BulkUpload

    def fields_from(fields)
      {
        date: Date.new(*fields[0].split('-').map(&:to_i)),
        name: fields[1],
        state: fields[2],
        fips: fields[3],
        cases: fields[4],
        deaths: fields[5]
      }
    end
  end
end
