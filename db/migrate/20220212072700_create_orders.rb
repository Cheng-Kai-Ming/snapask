class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :serial
      t.integer :user_id
      t.integer :course_id
      t.integer :amount
      t.datetime :paid_at
      t.string :state

      t.timestamps
    end
  end
end
