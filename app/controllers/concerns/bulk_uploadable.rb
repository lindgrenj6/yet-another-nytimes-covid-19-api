# frozen_string_literal: true

module BulkUploadable
  extend ActiveSupport::Concern

  included do
    def bulk_upload
      file = File.read(params.require(:file))
      model = controller_name.classify.constantize

      # clear the current records
      model.delete_all

      model.transaction do
        model.bulk_import(file)
        render json: model.all, status: 201
      end
    rescue StandardError => e
      render json: { "error": e.message }, status: 400
    end
  end
end
