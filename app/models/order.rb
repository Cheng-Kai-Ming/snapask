class Order < ApplicationRecord
  belongs_to :user
  belongs_to :course
  include AASM

  aasm column: 'state' do
    state :vaild, initial: true
    state :expired

    event :invalidate do
      transitions from: :vaild, to: :expired
    end

    event :validate do
      transitions from: :expired, to: :vaild
    end

    event :expire do
      transitions from: :available, to: :expired
    end
  end
end
