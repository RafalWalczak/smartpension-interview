# frozen_string_literal: true

#
# Service responsible for filtering responses
#
class AnalyticsService
  attr_reader :log_entries

  #
  # @param [Array<LogEntryModel>] log_entries
  #
  def initialize(log_entries)
    @log_entries = log_entries
  end

  #
  # @return [Array<LogEntryModel>] invalid log entry models
  #
  def errors
    @errors ||= @log_entries.select(&:invalid?)
  end

  #
  # @return [Array<Array[String, Integer]>]
  #
  def most_page_views
    @most_page_views = valid_entries.group_by(&:path)

    @most_page_views = @most_page_views.map { |k, v| [k, v.size] }

    @most_page_views.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }
  end

  #
  # @return [Array<Array[Array<String>, Integer]>]
  #
  def uniq_most_page_views # rubocop:disable Metrics/AbcSize
    @most_page_views = valid_entries.group_by { |entry| [entry.path, entry.ip] }

    @most_page_views = @most_page_views.map { |k, v| [k, v.size] }

    @most_page_views.sort { |a, b| [b[1], a[0][0], a[0][1]] <=> [a[1], b[0][0], b[0][1]] }
  end

  #
  # @return [Array<Array[String, Integer]>]
  #
  def most_client_views
    @most_page_views = valid_entries.group_by(&:ip)

    @most_page_views = @most_page_views.map { |k, v| [k, v.size] }

    @most_page_views.sort { |a, b| [b[1], a[0]] <=> [a[1], b[0]] }
  end

  private

  def valid_entries
    @valid_entries ||= @log_entries - errors
  end
end
