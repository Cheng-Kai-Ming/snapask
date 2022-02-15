class ChangeTimeTypeForCourses < ActiveRecord::Migration[6.1]
  def change
    change_column :courses, :valid_time, :string
  end
end
