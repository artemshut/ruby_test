# frozen_string_literal: true

module Queries
  ##
  # This class represents sorting by uniq visits query for log statistics
  #
  class UniqStatisticsQuery
    attr_reader :log_statistics

    def initialize(log_statistics)
      @log_statistics = log_statistics
    end

    def execute
      log_statistics.sort_by(&:uniq_visits).reverse!
    end
  end
end
