# frozen_string_literal: true

require 'spec_helper'
require 'models/log_entry_model'

RSpec.describe LogEntryModel, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:path) }
    it { is_expected.to validate_presence_of(:ip) }
    it { is_expected.to validate_presence_of(:line_number) }
  end
end
