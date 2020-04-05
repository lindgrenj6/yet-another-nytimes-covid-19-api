# frozen_string_literal: true

module FilteredResponse
  extend ActiveSupport::Concern

  included do
    def as_json(*args)
      columns = self.class.column_names - %w[id created_at updated_at]

      super.slice(*columns)
    end
  end
end
