# frozen_string_literal: true

##
# This class represents the main entry of the whole parsing process
#
class Parser
  attr_reader :log_storage, :output, :statistics_storage

  def initialize(log_storage:, statistics_storage:, output:)
    @log_storage = log_storage
    @statistics_storage = statistics_storage
    @output = output
  end

  def parse
    log_records = log_storage.process_file
    statistics_records = statistics_storage.new(log_records).collect
    output.new(statistics_records).show_statistics
  end
end
