# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
seed_file = Rails.root.join('db', 'seeds', 'fake_project.yml')
config = HashWithIndifferentAccess.new(YAML::load_file(seed_file))
config = config[:projects]

config.each do |k, v|
  project = Project.create title: k[:title]
  
  todos = k.values_at(:todos)
  todos.each do |value|
    # print value
    todo = Todo.create(value)
    project.todos << todo
  end
  next
end
