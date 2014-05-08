class Ankur < ActiveRecord::Migration
  def up
    admin = User.new
    admin.username = "ankur"
    admin.password = "secret"
    admin.password_confirmation = "secret"
    admin.role = "admin"
    admin.save!

    instructor = User.new
    instructor.username = "instructor"
    instructor.password = "secret"
    instructor.instructor_id = 7
    instructor.password_confirmation = "secret"
    instructor.role = "instructor"
    instructor.save!
  end

  def down
    admin = User.find_by_username "ankur"
    instructor = User.find_by_username "instructor"
    User.delete instructor
    User.delete admin
  end
end
