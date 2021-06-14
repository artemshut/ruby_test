# frozen_string_literal: true

module Services
  ##
  # This class represents formatting displayed data, i.e. uniq visits
  # and visits in general
  #
  class StatisticsFormatter
    attr_reader :log_statistics

    def initialize(log_statistics)
      @log_statistics = log_statistics
      @statistics = ''
    end

    def display_formatted_statistics
      add_visits_statistics
      add_uniq_visits_statistics
      puts @statistics
      @statistics
    end

    private

    def add_visits_statistics
      sorted_visits.each { |stat| @statistics += "#{stat.url} #{stat.visits} visits \n" }
    end

    def add_uniq_visits_statistics
      sorted_uniq_visits.each { |uniq_stat| @statistics += "#{uniq_stat.url} #{uniq_stat.uniq_visits} uniq visits \n" }
    end

    def sorted_visits
      Queries::StatisticsQuery.new(log_statistics).execute
    end

    def sorted_uniq_visits
      Queries::UniqStatisticsQuery.new(log_statistics).execute
    end
  end
end
