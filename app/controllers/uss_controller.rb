class UssController < ApplicationController
  include BulkUploadable
  include Filterable

  def index
    respond_to do |format|
      format.csv do
        csv = filtered_index.map { "#{_1.date},#{_1.cases},#{_1.deaths}" }
        csv.unshift("date,name,cases,deaths")

        send_data csv.join("\n"), :type => 'text/csv', :disposition => 'inline'
      end

      format.any(:json, :html) { render json: filtered_index }
    end
  end

  def model
    Us
  end
end
