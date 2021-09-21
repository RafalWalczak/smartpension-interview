# frozen_string_literal: true

# frozen_string_literal

require 'services/parser_service'
require 'models/log_entry_model'

RSpec.describe ParserService do
  let(:file_path) { 'spec/files/webserver.log' }

  describe '#call' do
    subject(:call) { described_class.new(file_path).call! }

    it { is_expected.to be_instance_of(Array) }
    it { is_expected.to include(a_kind_of(LogEntryModel)) }

    it { expect(call.size).to eq 3 }
    it { expect { call }.not_to raise_error }

    context 'when file is empty' do
    end
  end
end
