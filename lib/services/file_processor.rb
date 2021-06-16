# frozen_string_literal: true

module Services
  ##
  # This class represents initial file processing i.e. validation
  # and log entries structure
  #
  class FileProcessor
    attr_reader :file_path, :log_entries

    def initialize(file_path)
      @file_path = file_path
      @log_entries = []
    end

    def process_file
      validate_file
      store_log_entries
    end

    private

    def validate_file
      Validators::FileValidator.new(file_path).validate
    end

    def store_log_entries
      file = File.foreach(file_path)
      file.each_entry do |line|
        log_entry_url, log_entry_ip_address = line.split(' ')
        log_entries << Entities::LogEntry.new(log_entry_url, log_entry_ip_address)
      end
      log_entries
    end
  end
end
