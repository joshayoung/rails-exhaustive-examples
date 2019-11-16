# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teachers = Teacher.create!([
  { name: "joe", age: 31 },
  { name: "sally", age: 25 },
  { name: "frank", age: 25 },
  { name: "sue", age: 27 }
])

Degree.create!(
  title: "doctorate of history",
  level: 3,
  completed: Date.today - 10.years,
  from: "washington university",
  teacher: teachers.first
)
Degree.create!(
  title: "Bachelor of Science",
  level: 1,
  completed: Date.today - 4.years,
  from: "Columbia",
  teacher: teachers[1]
)
Degree.create!(
  title: "Masters of Arts",
  level: 3,
  completed: Date.today - 6.years,
  from: "Georgia State",
  teacher: teachers[2]
)

students = Student.create!([
  { name: "James", average_grade: 91, class_of: Date.today + 3.years },
  { name: "Thomas", average_grade: 97, class_of: Date.today + 5.years },
  { name: "Kelly", average_grade: 94, class_of: Date.today + 2.years },
  { name: "Ben", average_grade: 84, class_of: Date.today + 1.years },
  { name: "Amanda", average_grade: 90, class_of: Date.today + 6.years }
])

klasses = Klass.create!([
  { name: "Chemestry 101", time: Date.today, level: 1, teacher: teachers.first },
  { name: "History 201", time: Date.today, level: 2, teacher: teachers[1] },
  { name: "Algebra 301", time: Date.today, level: 3, teacher: teachers[2] },
  { name: "Physics 401", time: Date.today, level: 4, teacher: teachers[3] }
])

Registrar.create!([
 { klass: klasses.first, student: students.first },
 { klass: klasses[2], student: students[1] },
 { klass: klasses[3], student: students[3] }
])
