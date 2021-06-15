# frozen_string_literal: true

require 'queries/uniq_statistics_query'
require 'entities/page_statistics'

describe Queries::UniqStatisticsQuery do
  subject(:uniq_query) { described_class.new(log_statistics) }

  let(:log_statistics) do
    [
      Entities::PageStatistics.new('/home', 4, 3),
      Entities::PageStatistics.new('/about', 6, 6),
      Entities::PageStatistics.new('/contact', 7, 5)
    ]
  end

  it 'returns PageStatistics values' do
    expect(uniq_query.execute.first).to be_instance_of(Entities::PageStatistics)
  end

  it 'returns array of values' do
    expect(uniq_query.execute).to be_instance_of(Array)
  end

  it 'returns first record with more views' do
    expect(uniq_query.execute.first.uniq_visits).to eq(6)
  end

  it 'returns last record with less views' do
    expect(uniq_query.execute.last.uniq_visits).to eq(3)
  end
end
