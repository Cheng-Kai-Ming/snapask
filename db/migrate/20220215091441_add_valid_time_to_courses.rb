class AddValidTimeToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :valid_time, :integer
  end
end
