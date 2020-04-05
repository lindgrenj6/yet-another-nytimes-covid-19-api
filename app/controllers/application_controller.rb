# frozen_string_literal: true

class ApplicationController < ActionController::API
  def model
    controller_name.classify.constantize
  end
end
