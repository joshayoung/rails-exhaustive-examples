require "rails_helper"

RSpec.feature "Statistics" do
  before do
    Student.create(
      name: "Joe",
      average_grade: 90,
      class_of: Date.today + 2.years
    )
    Student.create(
      name: "Joe",
      average_grade: 90,
      class_of: Date.today + 2.years
    )
    Teacher.create(name: "Sam", age: 34)
    teacher2 = Teacher.create(name: "Emily", age: 31)
    Degree.create(
      title: "doctorate of history",
      level: 3,
      completed: Date.today - 10.years,
      from: "washington university",
      teacher: teacher2
    )
    Degree.create(
      title: "doctorate of science",
      level: 3,
      completed: Date.today - 2.years,
      from: "florida university",
      teacher: teacher2
    )
  end
  describe "#students" do
    it "returns the count of students" do
      expect(Statistic.new.students).to eq(2)
    end
  end

  describe "#teachers" do
    it "returns the count of teaches" do
      expect(Statistic.new.teachers).to eq(2)
    end
  end

  describe "#teacher_with_most_degrees" do
    it "returns the teacher with the most degrees" do
      expect(Statistic.new.teachers_with_most_degrees).to eq("Emily")
    end
  end
end
