class CreateStudents < ActiveRecord::Migration
  def change
        create_table :students do |t|
          t.string :username
          t.string :email 
          t.string :password_digest 
          t.string :name 
          t.integer :grade 
    end
  end
end
