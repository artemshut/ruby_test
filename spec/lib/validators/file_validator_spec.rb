# frozen_string_literal: true

describe Validators::FileValidator do
  subject(:validator) { described_class.new(file_path) }

  context 'when file path is correct' do
    let(:file_path) { 'spec/fixtures/webserver.log' }

    it 'passes validation' do
      expect(subject.validate).to be_truthy
    end
  end

  context 'when file path is not correct' do
    let(:file_path) { 'wrong path.log' }

    it 'throws an file presence error' do
      expect { subject.validate }.to raise_error(Validators::FilePresenceError)
    end
  end

  context 'when file extension is not correct' do
    let(:file_path) { 'spec/fixtures/webserver.txt' }

    it 'throws an file extension error' do
      expect { subject.validate }.to raise_error(Validators::FileExtensionError)
    end
  end

  context 'when file is empty' do
    let(:file_path) { 'spec/fixtures/empty.log' }

    it 'throws an file extension error' do
      expect { subject.validate }.to raise_error(Validators::FileEmptyError)
    end
  end
end
