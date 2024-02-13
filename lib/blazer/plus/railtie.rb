# frozen_string_literal: true

require 'rails/railtie'
require_relative 'queries_controller'

module Blazer
  module Plus
    class Railtie < ::Rails::Railtie
      # Some gems (for example, action_policy) extend ActionController::Base in their to_prepare blocks and
      # the blocks must be called before subclasses of ActionController::Base are loaded.
      # So following to_prepare block must be called after other gems' to_prepare blocks.
      # `before: :add_to_prepare_blocks` enforces the order of them.
      initializer :initialize_blazer_plus, before: :add_to_prepare_blocks do
        Rails.application.config.to_prepare do
          ::Blazer::QueriesController.prepend(::Blazer::Plus::QueriesController) if ::Blazer::Plus.enabled
        end
      end
    end
  end
end
