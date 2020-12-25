# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def model
    controller_name.classify.constantize
  end
end
