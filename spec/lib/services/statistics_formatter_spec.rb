# frozen_string_literal: true

require 'services/statistics_formatter'

describe Services::StatisticsFormatter do
  subject(:formatter) { described_class.new(log_statistics) }

  let(:log_statistics) do
    [
      Entities::PageStatistics.new('/contact', 6, 5),
      Entities::PageStatistics.new('/about', 2, 1)
    ]
  end

  let(:output_text) do
    "##### Webpages with most page views #####\n/contact 6 visits \n/about 2 visits \n" \
    "##### Webpages with most unique page views ######\n/contact 5 uniq visits \n/about 1 uniq visits \n"
  end

  it 'returns correct response to user' do
    expect { formatter.show_statistics }.to output(output_text).to_stdout
  end
end
