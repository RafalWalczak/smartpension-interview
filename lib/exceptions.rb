# frozen_string_literal: true

module Exceptions
  class EmptyFile < StandardError; end

  class FileTypeError < StandardError; end

  class FileNotFound < StandardError; end
end
