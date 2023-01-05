class ToDoItem < ApplicationRecord
  enum status: { active: "active", done: "done" }
end
