# frozen_string_literal: true

require 'active_model'

class LogEntryModel
  include ActiveModel::Model

  attr_accessor :path, :ip

  validates :path, presence: true
  validates :ip, presence: true
end
