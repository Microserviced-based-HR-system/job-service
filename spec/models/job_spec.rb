require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should belong_to(:job_type) }
    it { should have_many(:applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:company_id) }
  end

  describe 'enums' do
    it 'validates enum values' do
      should define_enum_for(:status).with_values(
        pending: 0,
        open: 1,
        close: 2
      )
    end

    it 'sets default enum value when application is created' do
      job = FactoryBot.create(:job)
      expect(job.status).to eq('pending')
    end
  end
end
