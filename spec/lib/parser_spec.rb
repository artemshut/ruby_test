# frozen_string_literal: true

require 'parser'

describe Parser do
  subject(:parser) do
    described_class.new(
      log_storage: log_storage,
      statistics_storage: statistics_storage_class,
      output: output_class
    )
  end

  let(:log_entries) { [Entities::LogEntry.new('/contact', '192.168.1.1')] }
  let(:page_statistics) { [Entities::PageStatistics.new('/contact', 3, 2)] }
  let(:log_storage) { instance_double Services::FileProcessor, process_file: log_entries }
  let(:statistics_storage_class) { class_double Services::StatisticsCollector, new: statistics_storage }
  let(:statistics_storage) { instance_double Services::StatisticsCollector, collect: page_statistics }
  let(:output_class) { class_double Services::StatisticsFormatter, new: output }
  let(:output) { instance_double Services::StatisticsFormatter }

  let(:output_text) do
    "##### Webpages with most page views #####\n/contact 6 visits \n" \
    "##### Webpages with most unique page views ######\n/contact 5 uniq visits \n"
  end

  before do
    allow(output).to receive(:show_statistics)
  end

  it 'successfully calls displaying of statistics' do
    expect(output).to receive(:show_statistics).and_return(output_text)
    parser.parse
  end
end
