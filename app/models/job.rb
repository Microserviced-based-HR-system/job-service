class Job < ApplicationRecord
  belongs_to :job_type

  validates :company_id, presence: true

  has_many :applications

  enum status: {
         pending: 0,
         open: 1,
         close: 2
       },
       _default: :pending
end
