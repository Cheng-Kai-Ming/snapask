module ApiV0
  class Orders < Grape::API
    before { authenticate! }
    desc "Get all Orders"
    get "/orders" do
      current_user
      byebug
      current_user.orders
      # result = present orders, with: ApiV0::Entities::Orders
      # result = result.as_json
    end
  end
end