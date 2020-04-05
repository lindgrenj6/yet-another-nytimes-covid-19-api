# frozen_string_literal: true

class CountiesController < ApplicationController
  include BulkUploadable
  include Filterable

  def index
    render json: filtered_index
  end
end
