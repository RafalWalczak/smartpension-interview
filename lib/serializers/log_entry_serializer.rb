# frozen_string_literal: true

#
# Serializer of the +LogEntryModel+
#
class LogEntrySerializer < SimpleDelegator
  #
  # @return [Hash]
  #
  def as_json
    {
      path: path,
      line_number: line_number,
      ip: ip
    }
  end
end
