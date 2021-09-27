# frozen_string_literal: true

require 'active_model'

class LogEntryModel
  include ActiveModel::Model
  include ActiveModel::Serialization

  attr_accessor :path, :ip, :line_number

  validates :path, presence: true
  validates :ip, presence: true
  validates :line_number, presence: true
end
