module ApiV0
  class Orders < Grape::API
    
    before { authenticate! }

    desc "Get all Orders"
    get "/orders" do
      result = current_user.orders
      result = result.as_json
      # result = present orders, with: ApiV0::Entities::Orders
      # result = result.as_json
    end

    desc "Create order"
    params do
      requires :course_id, type: Integer
      requires :amount, type: Integer
    end
    post "/build/order" do
      order = current_user.orders.new(declared(params, include_missing: false).except(:access_key))

      if order.save
        present order, with: ApiV0::Entities::Order
      else
        raise StandardError, $!
      end
    end
  end
end
