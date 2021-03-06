require "rails_helper"

# CRUD
RSpec.feature "Teachers", type: :feature do
  describe "Create" do
    context "when I visit the new teacher page" do
      it "can add a new teacher" do
        visit new_teacher_path

        within("form") do
          fill_in "teacher_name", with: "James"
          fill_in "teacher_age", with: "60"
        end

        click_button "Create Teacher"
        expect(page).to have_content("Teacher was successfully created.")
      end
    end

    describe "Read" do
      context "when I visit the show page" do
        before do
          Teacher.create(name: "Sam", age: 41)
        end
        it "can see teacher details" do
          visit teacher_path(Teacher.first)

          expect(page).to have_content("Name: Sam")
          expect(page).to have_content("Age: 41")
        end
      end
      context "when I visite the index page" do
        before(:each) do
          Teacher.create(name: "Sam", age: 41)
          Teacher.create(name: "Sue", age: 31)
        end

        it "can see a list of teachers" do
          visit teachers_path

          expect(page).to have_content("Sam")
          expect(page).to have_content("Sue")
        end
      end
    end

    describe "Update" do
      context "when I visit the edit page" do
        it "can fill out form, get success message, and update teacher" do
          teacher = Teacher.create(name: "Sam", age: 41)
          visit edit_teacher_path(teacher)

          within("form") do
            fill_in "teacher_name", with: "Jack"
            fill_in "teacher_age", with: "45"
          end

          click_button "Update Teacher"

          expect(page).to have_content("Teacher was successfully updated.")

          teacher.reload
          expect(teacher.name).to eq("Jack")
          expect(teacher.age).to eq("45")
        end
      end
    end

    describe "Delete" do
      context "when I visit the index page" do
        before(:each) do
          Teacher.create(name: "Sam", age: 41)
          Teacher.create(name: "Sue", age: 31)
        end
        it "can delete a teacher" do
          visit teachers_path
          teacher = Teacher.first

          within("//table/tbody/tr[1]/td[5]") do
            click_link "Destroy"
          end

          expect(page).to have_content("Teacher was successfully destroyed.")
          expect(page).to_not have_content("Sam")
          expect(page).to have_content("Sue")
          expect(Teacher.all).not_to include(teacher)
        end
      end
    end

    context "Miscellaneous" do
      before(:each) do
        Teacher.create(name: "Sam", age: 41)
        Teacher.create(name: "Sue", age: 31)
      end
      it "can add a degree" do
        visit "teachers"

        within("//table/tbody/tr[1]/td[6]") do
          click_link "Add Degree"
        end

        expect(page).to have_content("New Degree")
      end

      it "can add a class" do
        visit "teachers"

        within("//table/tbody/tr[1]/td[7]") do
          click_link "Add Class"
        end

        expect(page).to have_content("New Class")
      end
    end

    context "when I visit the teacher show page" do
      before(:each) do
        Teacher.create!(name: "Sam", age: 41)
        Klass.create!(
          name: "first class",
          time: Date.today,
          level: 1,
          teacher: Teacher.first
        )
        Degree.create!(
          title: "first degree",
          level: 2,
          completed: Date.yesterday - 1.year,
          from: "college",
          teacher: Teacher.first
        )
        Student.create!(
          name: "James Jones",
          average_grade: 93,
          class_of: Date.today + 10.years
        )
        Registrar.create!(
          klass: Klass.first,
          student: Student.first
        )
      end

      it "show the classes being taught" do
        visit "teachers/#{Teacher.first.id}"

        expect(page).to have_content("Classes:")
        expect(page).to have_content("first class")
      end

      it "list the degrees attained" do
        visit "teachers/#{Teacher.first.id}"

        expect(page).to have_content("Degrees:")
        expect(page).to have_content("First Degree")
      end

      it "lists each teacher's students" do
        visit "teachers/#{Teacher.first.id}"

        expect(page).to have_content("Students:")
        expect(page).to have_content("James Jones")
      end
    end
  end
end
