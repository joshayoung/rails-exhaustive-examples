require 'rails_helper'

RSpec.feature "Degrees", type: :feature do
  describe "teachers/:teacher_id/degrees" do
    let(:teacher) { Teacher.create(name: "Sam", age: 41) }

    before do
      Degree.create(
        title: "doctorate of history",
        level: 3,
        completed: Date.today - 10.years,
        from: "washington university",
        teacher: teacher
      )
      Degree.create(
        title: "doctorate of art",
        level: 3,
        completed: Date.today - 10.years,
        from: "texas university",
        teacher: teacher
      )
    end
    it "can see a list of degrees" do
      visit "teachers/#{teacher.id}/degrees"

      expect(page).to have_content("Degrees")
      expect(page).to have_content("Doctorate Of History")
      expect(page).to have_content("3")
    end

    it "can delete a degree" do
      visit "teachers/#{teacher.id}/degrees"

      expect(page).to have_content("Degrees")

      within("//table/tbody/tr[1]/td[6]") do
        click_link "Destroy"
      end

      expect(page).to have_content("Degree was successfully destroyed.")
    end
  end

  describe "teachers/:teacher_id/degrees/new" do
    context "when I visit the degree's new page" do
      let(:teacher) { Teacher.create(name: "Sam", age: 41) }

      it "can add a new degree" do
        visit "teachers/#{teacher.id}/degrees"

        click_on "New Degree"

        expect(page).to have_content("New Degree")

        within("form") do
          fill_in "degree_title", with: "Doctorate of Science"
          fill_in "degree_level", with: "2"
          select (Date.yesterday - 1.year).strftime("%Y"), from: "degree_completed_1i"
          select Date.yesterday.strftime("%B"), from: "degree_completed_2i"
          select Date.yesterday.strftime("%-d"), from: "degree_completed_3i"
        end

        click_button "Create Degree"

        expect(page).to have_content("Degree was successfully created.")
      end
    end
  end

  describe "teachers/:teacher_id/degrees/:id" do
    context "when I visit the degree's show page" do
      let(:teacher) { Teacher.create(name: "Sam", age: 41) }
      let(:degree) do
        Degree.create(
          title: "doctorate of history",
          level: 3,
          completed: Date.today - 10.years,
          from: "washington university",
          teacher: teacher
        )
      end

      it "see the degree's details" do
        visit "teachers/#{teacher.id}/degrees/#{degree.id}"

        expect(page).to have_content("Doctorate Of History")
        expect(page).to have_content("3.0")
        expect(page).to have_content("#{(Date.today - 10.years).strftime('%Y-%m-%d')}")
      end
    end
  end

  describe "teachers/:teacher_id/degrees/:id/edit" do
    context "when I visit the degree's edit page" do
      let(:teacher) { Teacher.create(name: "Sam", age: 41) }
      let(:degree) do
        Degree.create(
          title: "doctorate of history",
          level: 3,
          completed: Date.today - 4.years,
          from: "washington university",
          teacher: teacher
        )
      end

      it "can edit the degree" do
        visit "teachers/#{teacher.id}/degrees/#{degree.id}/edit"

        expect(page).to have_content("Editing Degree")
        within("form") do
          fill_in "degree_title", with: "Doctorate of Art"
          fill_in "degree_level", with: "2"
          select (Date.yesterday - 1.year).strftime("%Y"), from: "degree_completed_1i"
          select Date.yesterday.strftime("%B"), from: "degree_completed_2i"
          select Date.yesterday.strftime("%-d"), from: "degree_completed_3i"
        end
        click_button "Update Degree"
        expect(page).to have_content("Degree was successfully updated.")
      end
    end
  end
end
