class Application < ApplicationRecord
  belongs_to :job

  has_many_attached :files

  validates :candidate_id, presence: true

  after_update :set_submitted_at, if: :submitted?

  enum status: {
         draft: 0,
         submitted: 1,
         screening: 2,
         passed: 3,
         rejected: 4,
         cancelled: 5
       },
       _default: :draft

  private

  def set_submitted_at
    self.submitted_at = Time.now
  end
end
