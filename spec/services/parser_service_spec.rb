# frozen_string_literal: true

# frozen_string_literal

require 'services/parser_service'
require 'models/log_entry_model'

RSpec.describe(ParserService) do
  let(:file_path) { 'spec/files/webserver.log' }

  describe '#call' do
    subject(:call) { described_class.new(file_path).call! }

    it { is_expected.to(be_instance_of(Array)) }
    it { is_expected.to(include(a_kind_of(LogEntryModel))) }

    it { expect(call.size).to(eq(3)) }

    it {
      expect { call }
        .not_to(raise_error)
    }

    context 'when file is empty' do
      let(:file_path) { 'spec/files/empty.log' }

      it {
        expect { call }
          .to(raise_error(Exceptions::EmptyFile))
      }
    end

    context 'when file contain only empty lines' do
      let(:file_path) { 'spec/files/empty_entries.log' }

      it {
        expect { call }
          .to(raise_error(Exceptions::EmptyFile))
      }
    end

    context 'when file does not exists' do
      let(:file_path) { 'spec/files/missing_file.log' }

      it {
        expect { call }
          .to(raise_error(Exceptions::FileNotFound))
      }
    end

    context 'when file is different content type' do
      let(:file_path) { 'spec/files/image.jpeg' }

      pending do
        expect { call }
          .to(raise_error(Exceptions::FileTypeError))
      end
    end
  end
end
