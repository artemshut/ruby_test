# frozen_string_literal: true

module Services
  ##
  # This class represents the main entry of the whole parsing process
  #
  class Parser
    def initialize(file_path)
      @file_path = file_path
    end

    def parse_file
      process_log_file
      collect_statistics
      display_formatted_statistics
    end

    private

    def process_log_file
      @log_entries = FileProcessor.new(@file_path).process_file
    end

    def collect_statistics
      @log_statistics = StatisticsCollector.new(@log_entries).collect
    end

    def display_formatted_statistics
      StatisticsFormatter.new(@log_statistics).display_formatted_statistics
    end
  end
end
