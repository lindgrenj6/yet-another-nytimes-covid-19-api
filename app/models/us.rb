class Us < ApplicationRecord
  include FilteredResponse

  default_scope -> { order(:date) }

  class << self
    include BulkUpload

    def fields_from(fields)
      {
        date: Date.new(*fields[0].split('-').map(&:to_i)),
        cases: fields[1],
        deaths: fields[2],
        created_at: Time.zone.now,
        updated_at: Time.zone.now
      }
    end
  end
end
