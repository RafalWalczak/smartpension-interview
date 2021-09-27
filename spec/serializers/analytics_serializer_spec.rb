# frozen_string_literal: true

require 'spec_helper'
require 'serializers/analytics_serializer'
require 'services/analytics_service'
require 'services/parser_service'
require 'models/log_entry_model'

RSpec.describe(AnalyticsSerializer, type: :presenter) do
  let(:analytics_serializer) { described_class.new(analytics_service) }
  let(:analytics_service)    { AnalyticsService.new(log_entries)      }
  let(:log_entries)          { ParserService.new(file_path).call!     }
  let(:file_path)            { 'spec/files/webserver.log'             }

  describe '#as_json' do
    subject(:as_json) { analytics_serializer.as_json }

    it { expect(as_json[:most_page_views].size).to(eq(2)) }
  end
end
