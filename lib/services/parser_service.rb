# frozen_string_literal: true

# frozen_string_literal

require 'models/log_entry_model'
require 'exceptions'

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

    raise Exceptions::FileNotFound unless File.exist?(@absolute_path)

    raise Exceptions::EmptyFile if File.zero?(@absolute_path)

    parse

    raise Exceptions::EmptyFile if @log_entries.empty?

    @log_entries
  end

  private

  def parse
    File.open(@absolute_path) do |file|
      file.each do |line|
        @log_entries << line_convert(line, file.lineno) unless line.strip.empty?
      end
    end
  end

  def line_convert(line, line_number)
    attributes = line.split(' ')

    LogEntryModel.new(
      path: attributes[0],
      ip: attributes[1],
      line_number: line_number
    )
  end
end
