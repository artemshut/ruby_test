# frozen_string_literal: true

module Services
  ##
  # This class represents converting bunch of log entries into
  # more useful page statistics entity
  #
  class StatisticsCollector
    attr_reader :log_entries

    def initialize(log_entries)
      @log_entries = log_entries
      @log_statistics = []
    end

    def collect
      log_entries.group_by(&:url).each do |url, log_entries|
        uniq_visits = log_entries.uniq(&:ip_address)
        @log_statistics << Entities::PageStatistics.new(url, log_entries.count, uniq_visits.count)
      end
      @log_statistics
    end
  end
end
