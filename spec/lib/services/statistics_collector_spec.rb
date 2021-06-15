# frozen_string_literal: true

require 'services/statistics_collector'

describe Services::StatisticsCollector do
  subject(:collector) { described_class.new(log_entries) }

  let(:log_entries) do
    [
      Entities::LogEntry.new('/contact', '444.701.448.104'),
      Entities::LogEntry.new('/contact', '444.701.448.104'),
      Entities::LogEntry.new('/about', '987.111.726.873')
    ]
  end

  it 'converts log entries to page statistics' do
    expect(collector.collect.first).to be_instance_of(Entities::PageStatistics)
  end

  it 'groups records correctly by url' do
    expect(collector.collect.first.visits).to eq(2)
  end

  it 'correctly calculates uniq visits' do
    expect(collector.collect.first.uniq_visits).to eq(1)
  end
end
