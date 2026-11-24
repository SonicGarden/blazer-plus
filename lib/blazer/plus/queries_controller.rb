# frozen_string_literal: true

require 'active_support/concern'

module Blazer
  module Plus
    module QueriesController
      extend ActiveSupport::Concern

      DEFAULT_ROW_LIMIT = 5000

      prepended do
        before_action :blazer_danger_actionable!, only: %i[new edit create update destroy]
      end

      # NOTE: Support BOM for Excel
      def csv_data(columns, rows, data_source)
        "\xEF\xBB\xBF#{super}"
      end

      # NOTE: Support row_limit setting.
      # Don't check `request.format == :html`: blazer 3.5+ fetches results without an
      # Accept header, so the format is */*. Only CSV download should be unlimited.
      def render_run
        row_limit = Blazer.settings.fetch('row_limit', DEFAULT_ROW_LIMIT)
        @row_limit ||= row_limit if row_limit && !request.format.csv?

        super
      end

      private

      def blazer_danger_actionable!
        if !blazer_user || !Blazer::Plus.blazer_danger_actionable_method.respond_to?(:call) || !Blazer::Plus.blazer_danger_actionable_method.call(blazer_user)
          Rails.logger.warn "BlazerQueriesController##{action_name} was forbidden for #{blazer_user.inspect}"
          render plain: '403 Forbidden', status: :forbidden
        end
      end
    end
  end
end
