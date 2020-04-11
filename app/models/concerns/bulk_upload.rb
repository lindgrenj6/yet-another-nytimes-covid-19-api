# frozen_string_literal: true

module BulkUpload
  def bulk_import(csv)
    # ignore the header row
    records = csv.lines[1..-1]

    insert_all!(records.map { |record| fields_from(record.split(',')) })
  end
end
