class ChangeStringTypeForCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :valid_time
  end
end
