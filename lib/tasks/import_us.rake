# frozen_string_literal: true

require 'rake'

namespace :import do
  desc 'Import latest nytimes/covid-19-data/us.csv'
  task us: :environment do
    data = Faraday.get('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us.csv').body
    puts "Fetched new #{data.lines.count} line us document from nytimes/covid-19-data repo"

    Us.delete_all

    Us.transaction do
      Us.bulk_import(data)
    end
  end
end
