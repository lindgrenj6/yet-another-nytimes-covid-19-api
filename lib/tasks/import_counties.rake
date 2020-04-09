# frozen_string_literal: true

require 'rake'

namespace :import do
  desc 'Import latest nytimes/covid-19-data/us-counties.csv'
  task counties: :environment do
    data = Faraday.get('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv').body
    puts "Fetched new #{data.lines.count} line county document from nytimes/covid-19-data repo"

    County.delete_all

    County.transaction do
      County.bulk_import(data)
    end
  end
end
