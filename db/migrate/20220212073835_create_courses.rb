class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :price
      t.string :currency
      t.string :category
      t.string :state
      t.string :url
      t.text :intro
      t.time :valid

      t.timestamps
    end
  end
end
