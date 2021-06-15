# frozen_string_literal: true

module Queries
  ##
  # This class represents sorting by visits query for log statistics
  #
  class StatisticsQuery
    attr_reader :log_statistics

    def initialize(log_statistics)
      @log_statistics = log_statistics
    end

    def execute
      log_statistics.sort_by(&:visits).reverse!
    end
  end
end
