# frozen_string_literal: true

module BulkUploadable
  extend ActiveSupport::Concern

  included do
    before_action { params.permit(:file) }

    def bulk_upload
      file = File.read(params[:file])

      # clear the current records without callbacks
      model.delete_all

      model.transaction do
        model.bulk_import(file)
        render json: { "imported": model.count }, status: 201
      end
    rescue StandardError => e
      render json: { "error": e.message }, status: 400
    end
  end
end
