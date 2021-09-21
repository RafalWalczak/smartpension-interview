# frozen_string_literal: true

# frozen_string_literal
require 'active_model'

class LogEntryModel
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :path
  attribute :ip

  validates :path, presence: true
  validates :ip, presence: true
end
