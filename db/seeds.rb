# frozen_string_literal: true
#
def import_data(dataset, model)
  data = Faraday.get("https://raw.githubusercontent.com/nytimes/covid-19-data/master/#{dataset}").body
  puts "Fetched new #{data.lines.count} line #{dataset} document from nytimes/covid-19-data repo"

  model.delete_all
  model.transaction do
    model.bulk_import(data)
  end
end

import_data("us.csv", Us)
import_data("us-states.csv", State)
