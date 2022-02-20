module ApiV0
  module Entities
    class Order < Entities::Base
      expose :serial
      expose :amount
      expose :paid_at
      expose :state
      expose :created_at, format_with: :iso8601
    end
  end
end