# frozen_string_literal: true

class StatesController < ApplicationController
  include BulkUploadable
  include Filterable

  def index
    render json: filtered_index
  end
end
