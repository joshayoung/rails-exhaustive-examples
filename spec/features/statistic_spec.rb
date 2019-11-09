require 'rails_helper'

RSpec.feature "Statistics", type: :feature do
  describe "/stats" do
    context "when I visit the stats page with no data" do
      it "shows the default message" do
        visit "stats"

        expect(page).to have_content("No Degrees")
        expect(page).to have_content("No Students")
        expect(page).to have_content("No Teachers")
      end
    end

    context "when I visit the stats page with data" do
      before(:each) do
        Degree.create(
          title: "doctorate of history",
          level: 3,
          completed: Date.today - 10.years,
          from: "washington university",
          teacher: Teacher.create(name: "Joe", age: 31)
        )
        Student.create(
          name: "James",
          average_grade: 91,
          class_of: Date.today + 3.years
        )
      end

      it "shows the stats for each section" do
        visit "stats"

        expect(page).to have_content("Teacher with most degrees: Joe")
        expect(page).to have_content("Total number of students: 1")
        expect(page).to have_content("Total number of teachers: 1")
      end
    end
  end
end
