require "rails_helper"

RSpec.feature "Teacher" do
  describe ".students" do
    before do
      teacher = Teacher.create(name: "Sam", age: "41")
      registrar = Registrar.new
      student = Student.create(
        name: "James",
        average_grade: 80,
        class_of: Date.today + 1.years
      )
      klass = Klass.create(
        name: "Chemestry 101",
        time: Date.today,
        level: 1,
        teacher: teacher
      )
      registrar.klass = klass
      registrar.student = student
      registrar.save
    end

    it "returns a teacher's students" do
      teacher = Teacher.first
      value = Teacher.students(teacher.id)
      expect(value[0].name).to eq("James")
    end
  end

  describe "#age_i" do
    it "returns age as an integer" do
      teacher = Teacher.create(name: "Sam", age: "41")
      expect(teacher.age_i).to eq(41)
      expect(teacher.age_i).to be_a Integer
    end
  end
end
