require 'rails_helper'

RSpec.feature "Klasses", type: :feature do

  describe "teachers/:teacher_id/klasses/new" do
    context "when I visit the class's new page" do
      it "can add a new class" do
        teacher = Teacher.create(name: "Sam", age: 41)
        visit new_teacher_klass_path(teacher)

        within("form") do
          fill_in "klass_name", with: "Jack"
          select "23", from: "klass_time_4i"
          select "55", from: "klass_time_5i"
          fill_in "klass_level", with: "45"
        end

        click_button "Create Klass"
        expect(page).to have_content("Class was successfully created.")
      end
    end
  end

  describe "teachers/:teacher_id/degrees/:id" do
    context "when I visit the class's show page" do
      it "see the class's details" do
        teacher = Teacher.create(name: "Sam", age: 41)
        klass = Klass.create!(
          name: "test", 
          time: Time.now, 
          level: 2,
          teacher: teacher
        )
        visit "teachers/#{teacher.id}/klasses/#{klass.id}"
        expect(page).to have_content("test")
        # TODO: why is this not dispaying correctly on the page?
        # expect(page).to have_content(Time.now.strftime("%Y-%m-%-d %H:%M:%S UTC"))
        expect(page).to have_content(2.0)
      end
    end
  end

  describe "teachers/:teacher_id/klasses/:id/edit" do
    context "when I visit the class' edit page" do
      it "can edit the class" do
        teacher = Teacher.create(name: "Sam", age: 41)
        klass = Klass.create!(
          name: "test", 
          time: Time.now, 
          level: 2,
          teacher: teacher
        )
        visit "teachers/#{teacher.id}/klasses/#{klass.id}/edit"
        within("form") do
          fill_in "klass_name", with: "New Class"
          select "23", from: "klass_time_4i"
          select "55", from: "klass_time_5i"
          fill_in "klass_level", with: "4"
        end

        click_button "Update Klass"

        expect(page).to have_content("Class was successfully updated.")
      end
    end
  end

  describe "teachers/:teacher_id/klasses" do
    let(:teacher) { Teacher.create(name: "Sam", age: 41) }
    before(:each) do
      klass = Klass.create!(
        name: "first class", 
        time: Time.now, 
        level: 2,
        teacher: teacher
      )
      klass = Klass.create!(
        name: "another class", 
        time: Time.now, 
        level: 2,
        teacher: teacher
      )
    end
    it "can see a list of classes" do
      klass = Klass.create!(
        name: "first class", 
        time: Time.now, 
        level: 2,
        teacher: teacher
      )
      klass = Klass.create!(
        name: "another class", 
        time: Time.now, 
        level: 2,
        teacher: teacher
      )
      visit "teachers/#{teacher.id}/klasses"
      expect(page).to have_content("first class")
      expect(page).to have_content("another class")
    end

    it "can remove a class" do
      visit "teachers/#{teacher.id}/klasses"

      within("//table/tbody/tr[1]/td[6]") do
        click_link "Remove Class"
      end
      expect(page).to have_content("Class was successfully destroyed.")
    end
  end
end
