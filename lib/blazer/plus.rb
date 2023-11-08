# frozen_string_literal: true

require_relative "plus/version"

module Blazer
  module Plus
    class Error < StandardError; end

    class << self
      attr_accessor :enabled, :blazer_danger_actionable_method
    end

    self.enabled = true
    self.blazer_danger_actionable_method = nil
  end
end
