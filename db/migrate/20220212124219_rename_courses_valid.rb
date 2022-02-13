class RenameCoursesValid < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :valid, :valid_time
  end
end
