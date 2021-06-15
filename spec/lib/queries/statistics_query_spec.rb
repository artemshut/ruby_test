# frozen_string_literal: true

require 'queries/statistics_query'
require 'entities/page_statistics'

describe Queries::StatisticsQuery do
  subject(:query) { described_class.new(log_statistics) }

  let(:log_statistics) do
    [
      Entities::PageStatistics.new('/home', 4, 3),
      Entities::PageStatistics.new('/about', 2, 1),
      Entities::PageStatistics.new('/contact', 6, 5)
    ]
  end

  it 'returns PageStatistics values' do
    expect(query.execute.first).to be_instance_of(Entities::PageStatistics)
  end

  it 'returns array of values' do
    expect(query.execute).to be_instance_of(Array)
  end

  it 'returns first record with more views' do
    expect(query.execute.first.visits).to eq(6)
  end

  it 'returns last record with less views' do
    expect(query.execute.last.visits).to eq(2)
  end
end
