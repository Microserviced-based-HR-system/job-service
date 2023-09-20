require 'rails_helper'

RSpec.describe JobType, type: :model do
  describe 'associations' do
    it { should have_many(:jobs) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
