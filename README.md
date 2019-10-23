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

## References:
* Data Types: https://api.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_column