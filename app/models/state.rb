# frozen_string_literal: true

class State < ApplicationRecord
  class << self
    include ::BulkUpload

    def fields_from(fields)
      {
        date: Date.new(*fields[0].split('-').map(&:to_i)),
        name: fields[1],
        fips: fields[2],
        cases: fields[3],
        deaths: fields[4]
      }
    end
  end
end
