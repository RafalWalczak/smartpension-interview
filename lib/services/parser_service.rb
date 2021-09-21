# frozen_string_literal: true

# frozen_string_literal

require 'models/log_entry_model'

#
# Service is responsible for file parsing
#
# @author Rafal Walczak <rafal@codeev.pl>
#
class ParserService
  attr_reader :log_entries

  def initialize(path)
    @absolute_path = File.absolute_path(path)
  end

  def call!
    @log_entries = []

    File.open(@absolute_path) do |file|
      file.each do |line|
        @log_entries << line_convert(line)
      end
    end

    @log_entries
  end

  private

  def line_convert(line)
    attributes = line.split(' ')

    LogEntryModel.new(
      path: attributes[0],
      ip: attributes[1]
    )
  end
end
