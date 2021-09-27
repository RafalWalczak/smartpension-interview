# frozen_string_literal: true

#
# Analytics summary serializer
#
class AnalyticsSerializer
  #
  # @param [AnalyticsService] service <description>
  #
  def initialize(service)
    @service = service
  end

  #
  # @return [Hash] <description>
  #
  def as_json
    {
      most_page_views: @service.most_page_views,
      uniq_most_page_views: @service.uniq_most_page_views,
      most_client_views: @service.most_client_views,
      errors: @service.errors.map { |entry| LogEntrySerializer.new(entry).as_json }
    }
  end
end
