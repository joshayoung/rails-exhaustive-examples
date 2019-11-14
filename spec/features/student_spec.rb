require 'rails_helper'

RSpec.feature "Students", type: :feature do
  describe "students/new" do
    context "when I visit the new student page" do
      it "can add a new student" do
        visit "students/new"

        expect(page).to have_content("New Student")

        within("form") do
          fill_in "student_name", with: "Joe"
          fill_in "student_average_grade", with: "80"
          select (Date.tomorrow + 1.year).strftime("%Y"), from: "student_class_of_1i"
          select Date.tomorrow.strftime("%B"), from: "student_class_of_2i"
          select Date.tomorrow.strftime("%-d"), from: "student_class_of_3i"
        end

        click_button "Create Student"
        expect(page).to have_content("Student was successfully created.")
      end
    end

    context "when I visit the edit student page" do
      it "can edit a student" do
        student = Student.create(
          name: "Joe",
          average_grade: 90,
          class_of: Date.today + 2.years
        )

        visit "students/#{student.id}/edit"

        expect(page).to have_content("Editing Student")

        within("form") do
          fill_in "student_average_grade", with: "70"
        end

        click_button "Update Student"
        expect(page).to have_content("Student was successfully updated.")
        expect(page).to have_content("Average grade: 70")
      end
    end

    context "when I visit the student show page" do
      it "can see student details" do
        student = Student.create(
          name: "Joe",
          average_grade: 90,
          class_of: Date.today + 2.years
        )

        visit "students/#{student.id}"

        expect(page).to have_content("Name: Joe")
        expect(page).to have_content("Average grade: 90")
        expect(page).to have_content("Class of: #{Date.today + 2.years}")
      end
    end

    context "when I visit the student delete page" do
      it "can delete a student" do
        Student.create(
          name: "Joe",
          average_grade: 90,
          class_of: Date.today + 2.years
        )
        Student.create(
          name: "James",
          average_grade: 80,
          class_of: Date.today + 1.years
        )

        visit "students"

        expect(page).to have_content("Joe")
        expect(page).to have_content("James")

        within("//table/tbody/tr[1]/td[6]") do
          click_link "Destroy"
        end

        expect(page).to have_content("Student was successfully destroyed.")
        expect(page).to_not have_content("Joe")
        expect(page).to have_content("James")
      end
    end

    context "when I visit the students page" do
      before(:each) do
        Student.create(
          name: "James",
          average_grade: 80,
          class_of: Date.today + 1.years
        )
        Klass.create(
          name: "Chemestry 101",
          time: Date.today,
          level: 1,
          teacher: Teacher.create(name: "Joe", age: 31)
        )
      end

      it "can select a class and display the class on the show page" do
        visit "students"
        within("//table/tbody/tr[1]/td[7]") do
          click_link "Add Class"
        end

        expect(page).to have_content("Select a Class")

        select "Chemestry 101", :from => "klass_id"

        click_button "submit"

        expect(page).to have_content("Chemestry 101")
      end
    end
  end
end
