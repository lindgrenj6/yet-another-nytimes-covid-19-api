# frozen_string_literal: true

module BulkUpload
  def bulk_import(csv)
    # ignore the header row
    records = csv.lines[1..-1]

    records.each do |record|
      fields = record.split(',')

      create!(fields_from(fields))
    end
  end
end
