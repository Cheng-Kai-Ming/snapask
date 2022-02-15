class Course < ApplicationRecord
  has_many :orders
  include AASM
  
  aasm column: 'state' do
    state :available, initial: true
    state :expired, :unavailable

    event :listing do
      transitions from: [:unavailable, :expired], to: :available
    end

    event :inlisting do
      transitions from: :available, to: :unavailable
    end

    event :expire do
      transitions from: :available, to: :expired
    end
  end

end
