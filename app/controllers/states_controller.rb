# frozen_string_literal: true

class StatesController < ApplicationController
  include BulkUploadable
  include Filterable

  def index
    respond_to do |format|
      format.csv do
        csv = filtered_index.map { "#{_1.date},#{_1.name},#{_1.cases},#{_1.deaths}" }
        csv.unshift("date,name,cases,deaths")

        send_data csv.join("\n"), :type => 'text/csv', :disposition => 'inline'
      end

      format.any(:json, :html) { render json: filtered_index }
    end
  end
end
