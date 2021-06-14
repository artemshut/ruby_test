# frozen_string_literal: true

require 'services/statistics_formatter'
require 'queries/statistics_query'
require 'queries/uniq_statistics_query'
require 'entities/page_statistics'

describe Services::StatisticsFormatter do
  subject(:formatter) { described_class.new(log_statistics) }

  let(:log_statistics) do
    [
      Entities::PageStatistics.new('/contact', 6, 5),
      Entities::PageStatistics.new('/home', 4, 3),
      Entities::PageStatistics.new('/about', 2, 1)
    ]
  end

  it 'returns string value ' do
    expect(formatter.display_formatted_statistics).to be_instance_of(String)
  end

  it 'returns correct response to user' do
    expect(formatter.display_formatted_statistics).to include('/contact 6 visits')
  end
end
