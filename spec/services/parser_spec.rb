# frozen_string_literal: true

require 'services/parser'
require 'services/file_processor'
require 'validators/file_validator'
require 'validators/parser_error'
require 'entities/log_entry'

describe Services::Parser do
  subject(:parser) { described_class.new(file_path) }

  context 'when file is valid' do
    let(:file_path) { 'spec/fixtures/webserver.log' }

    it 'returns string value after all' do
      expect(parser.parse_file).to be_instance_of(String)
    end

    it 'returns correct LogEntry fields' do
      expect(parser.parse_file).to include('/help_page/1 80 visits')
    end
  end

  context 'when file is invalid' do
    let(:file_path) { 'spec/fixtures/webserve.log' }

    it 'raises an error' do
      expect { parser.parse_file }.to raise_error(Validators::FilePresenceError)
    end
  end
end
