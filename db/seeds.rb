# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teachers = Teacher.create([
  { name: "Joe", age: 31 },
  { name: "Sally", age: 25 },
  { name: "Frank", age: 25 },
  { name: "Sue", age: 27 }
])

Degree.create(
  title: "Doctorate of History",
  level: 3,
  completed: Date.today - 10.years,
  from: "Washington University",
  teacher: teachers.first
)
Degree.create(
  title: "Bachelor of Science",
  level: 1,
  completed: Date.today - 4.years,
  from: "Columbia",
  teacher: teachers[1]
)
Degree.create(
  title: "Masters of Arts",
  level: 3,
  completed: Date.today - 6.years,
  from: "Georgia State",
  teacher: teachers[2]
)

students = Student.create([
  { name: "James", average_grade: 91, class_of: Date.today + 3.years },
  { name: "Thomas", average_grade: 97, class_of: Date.today + 5.years },
  { name: "Kelly", average_grade: 94, class_of: Date.today + 2.years },
  { name: "Ben", average_grade: 84, class_of: Date.today + 1.years },
  { name: "Amanda", average_grade: 90, class_of: Date.today + 6.years }
])

klasses = Klass.create([
  { name: "Chemestry 101", time: 3, level: 1, teacher: teachers.first },
  { name: "History 201", time: 2, level: 2, teacher: teachers[1] },
  { name: "Algebra 301", time: 2, level: 3, teacher: teachers[2] },
  { name: "Physics 401", time: 3, level: 4, teacher: teachers[3] }
])

Registrar.create(klass: klasses.first, student: students.first)
Registrar.create(klass: klasses[2], student: students[1])
Registrar.create(klass: klasses[3], student: students[3])
