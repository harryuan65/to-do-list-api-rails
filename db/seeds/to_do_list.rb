puts "Seeding #{__FILE__}"
ToDoItem.create!(
  title: "Answer this: is Ruby on Rails is still a thing?",
  status: :active
)
ToDoItem.create!(
  title: "Learn ActiveRecord",
  status: :done
)
ToDoItem.create!(
  title: "Learn ActionMailer",
  status: :active
)
ToDoItem.create!(
  title: "Learn ActionCable",
  status: :active
)