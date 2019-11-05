## Commands to create project:
* rails new -T rails-exhaustive-examples
* bundle exec spring binstub --all

## Scaffold Commands:
* rails generate scaffold Student name:string average_grade:string class_of:date
* rails generate scaffold Teacher name:string age:string
* rails generate scaffold Klass name:string time:time level:numeric
* rails generate scaffold Degree title:string level:numeric completed:date

## Generation Commands:
* rails g controller home

## Association Examples:
* `teacher = Teacher.find(1)`
* `teacher.klasses` (one-to-many)
* `teacher.degrees` (one-to-many)
* `student = Student.find(1)`
* `student.klasses` (many-to-many through registrars)

## References:
* Data Types: https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_column
* Nested Routes with `form_with`: https://stackoverflow.com/questions/46919115/nested-resources-w-rails-5-1-form-with
* Associations: https://guides.rubyonrails.org/association_basics.html
* Rspec: https://github.com/rspec/rspec-rails

## To Do:
Why is `local: true` required for the validations to render on the form with 'render :new'
