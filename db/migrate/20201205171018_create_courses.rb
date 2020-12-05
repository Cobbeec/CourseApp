class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :subject 
      t.string :teacher 
      t.integer :student_id
    end
  end
end
