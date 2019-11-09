require 'rails_helper'

RSpec.feature "Teachers", type: :feature do
  describe "teachers/new" do
    context "when I visit the new teacher page" do
      it "can add a new teacher" do
        visit "teachers/new"

        expect(page).to have_content("New Teacher")

        within("form") do
          fill_in "teacher_name", with: "James"
          fill_in "teacher_age", with: "60"
        end

        click_button "Create Teacher"
        expect(page).to have_content("Teacher was successfully created.")
      end
    end

    context "when I visit the show page" do
      it "can see teacher details"
      it "can see the teacher's students"
      it "can see the teacher's classes"
      it "can see the teacher's degrees"
    end

    context "when I visit the edit page" do
      before(:each) do
        Teacher.create(name: "Sam", age: 41)
      end

      it "can update the teacher" do
        teacher = Teacher.first

        visit "teachers/#{teacher.id}/edit"

        within("form") do
          fill_in "teacher_name", with: "Jack"
          fill_in "teacher_age", with: "45"
        end

        click_button "Update Teacher"

        expect(page).to have_content("Teacher was successfully updated.")
      end
    end

    context "when I visit the teachers page" do
      before(:each) do
        Teacher.create(name: "Sam", age: 41)
        Teacher.create(name: "Sue", age: 31)
      end

      it "can see a list of teachers" do
        visit "teachers"

        expect(page).to have_content("Sam")
        expect(page).to have_content("Sue")
      end

      it "can delete a teacher" do
        visit "teachers"

        expect(page).to have_content("Sam")
        expect(page).to have_content("Sue")

        within("//table/tbody/tr[1]/td[5]") do
          click_link "Destroy"
        end

        expect(page).to have_content("Teacher was successfully destroyed.")
        expect(page).to_not have_content("Sam")
        expect(page).to have_content("Sue")
      end

      it "can add a degree"
      it "can add a class"
      it "show the clases being taught"
      it "list the degrees attained"
    end
  end
end
