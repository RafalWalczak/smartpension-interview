# frozen_string_literal: true

require_relative 'models/log_entry_model'
require_relative 'serializers/analytics_serializer'
require_relative 'serializers/log_entry_serializer'
require_relative 'services/analytics_service'
require_relative 'services/parser_service'
require_relative 'exceptions'

log_entries = ParserService.new(ARGV[0]).call!

analytics_service = AnalyticsService.new(log_entries)

serializer = AnalyticsSerializer.new(analytics_service)

pp serializer.as_json
