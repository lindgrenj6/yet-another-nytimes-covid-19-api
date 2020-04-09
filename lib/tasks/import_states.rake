# frozen_string_literal: true

require 'rake'

namespace :import do
  desc 'Import latest nytimes/covid-19-data/us-states.csv'
  task states: :environment do
    data = Faraday.get('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-states.csv').body
    puts "Fetched new #{data.lines.count} line state document from nytimes/covid-19-data repo"

    State.delete_all

    State.transaction do
      State.bulk_import(data)
    end
  end
end
