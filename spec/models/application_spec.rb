require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Application, type: :model do
  describe 'associations' do
    it { should belong_to(:job) }
    it { should have_many_attached(:files) }
  end

  describe 'validations' do
    it { should validate_presence_of(:candidate_id) }
  end

  describe 'enums' do
    it 'validates enum values' do
      should define_enum_for(:status).with_values(
        draft: 0,
        submitted: 1,
        screening: 2,
        passed: 3,
        rejected: 4,
        cancelled: 5
      )
    end

    it 'sets default enum value when application is created' do
      application = FactoryBot.create(:application)
      expect(application.status).to eq('draft')
    end
  end

  describe 'callbacks' do
    describe 'after_update' do
      it 'sets submitted_at when status is changed to submitted' do
        application = FactoryBot.create(:application)
        expect do
          application.update(status: :submitted)
        end.to change(application, :submitted_at).from(nil)
      end

      it 'does not set submitted_at when status is not changed to submitted' do
        application = FactoryBot.create(:application)
        expect do
          application.update(status: :screening)
        end.not_to change(application, :submitted_at)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
