class CreateCourses < ActiveRecord::Migration
  def change
      create_table :courses do |t|
        t.string :name
        t.string :subject 
        t.integer :class_time
        t.integer :student_id
      end
  end
end
