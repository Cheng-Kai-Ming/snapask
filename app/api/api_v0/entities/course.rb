module ApiV0
  module Entities
    class Course < Entities::Base
      expose :name
      expose :price
      expose :currency
      expose :category
      expose :state
      expose :intro
      expose :valid_time
      expose :created_at, format_with: :iso8601
    end
  end
end