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
      all_courses = current_user.orders.pluck(:course_id)
      if all_courses.include?(params[:course_id]) && current_user.orders.find_by(course_id:params[:course_id]).state == "vaild"
      else
        order = current_user.orders.new(declared(params, include_missing: false).except(:access_key))
        if order.save
          valid_time = Course.find_by(id:params[:course_id]).valid_time
          VaildDaysJob.set(wait: valid_time.days).perform_later(order)
          present order, with: ApiV0::Entities::Order      
        else
          raise StandardError, $!
        end
      end
    

    
    end
  end
end
