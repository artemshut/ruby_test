# frozen_string_literal: true

describe 'Integration testing' do
  subject(:parser) do
    Parser.new(
      log_storage: Services::FileProcessor.new(file_path),
      statistics_storage: Services::StatisticsCollector,
      output: Services::StatisticsFormatter
    )
  end

  context 'when file path is correct' do
    let(:file_path) { 'spec/fixtures/webserver.log' }
    let(:correct_output) { File.read('spec/fixtures/correct_output.txt') }

    it 'returns correct output' do
      expect { parser.parse }.to output(correct_output).to_stdout
    end
  end

  context 'when file path not correct' do
    let(:file_path) { 'spec/fixtures/webserver.txt' }

    it 'throws error' do
      expect { parser.parse }.to raise_error(Validators::FileExtensionError)
    end
  end
end
