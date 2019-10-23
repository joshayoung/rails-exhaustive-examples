json.extract! student, :id, :name, :average_grade, :class_of, :created_at, :updated_at
json.url student_url(student, format: :json)
