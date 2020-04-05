# frozen_string_literal: true

module Filterable
  extend ActiveSupport::Concern

  included do
    before_action { params.permit(:name, :filter) }

    def filtered_index
      by_filter(by_name(model.all))
    end

    def by_name(collection)
      params[:name] ? collection.where('lower(name) = ?', params[:name].downcase) : collection
    end

    def by_filter(collection)
      if params[:filter]
        filter = params[:filter].match(/^([a-z]+)(=|>|<|>=|<=){1}([a-z|0-9]+)$/)[1..3]
        raise "Invalid Filter #{params[:filter]}" if filter.count != 3

        field = filter[0].to_sym
        op = filter[1] == '=' ? '=='.to_sym : filter[1].to_sym
        criteria = filter[2]

        collection.select do |e|
          e.send(field).send(op, criteria)
        rescue ArgumentError
          e.send(field).send(op, criteria.to_i)
        end
      else
        collection
      end
    end
  end
end
