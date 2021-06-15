# frozen_string_literal: true

require 'services/file_processor'
require 'validators/file_validator'
require 'validators/parser_error'
require 'entities/log_entry'

describe Services::FileProcessor do
  subject(:processor) { described_class.new(file_path) }

  context 'when file is valid' do
    let(:file_path) { 'spec/fixtures/webserver.log' }

    it 'returns correct records amount' do
      expect(processor.process_file.count).to eq(500)
    end

    it 'returns LogEntry records' do
      expect(processor.process_file.first).to be_instance_of(Entities::LogEntry)
    end

    it 'returns correct LogEntry fields' do
      expect(processor.process_file.first.ip_address).to eq('126.318.035.038')
    end
  end

  context 'when file is invalid' do
    let(:file_path) { 'spec/fixtures/webserve.log' }

    it 'raises an error' do
      expect { processor.process_file }.to raise_error(Validators::FilePresenceError)
    end
  end
end
