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
    end

    def show_statistics
      show_visits_statistics
      show_uniq_visits_statistics
    end

    private

    def show_visits_statistics
      puts '##### Webpages with most page views #####'
      sorted_visits.each { |stat| puts "#{stat.url} #{stat.visits} visits \n" }
    end

    def show_uniq_visits_statistics
      puts '##### Webpages with most unique page views ######'
      sorted_uniq_visits.each { |uniq_stat| puts "#{uniq_stat.url} #{uniq_stat.uniq_visits} uniq visits \n" }
    end

    def sorted_visits
      Queries::StatisticsQuery.new(log_statistics).execute
    end

    def sorted_uniq_visits
      Queries::UniqStatisticsQuery.new(log_statistics).execute
    end
  end
end
