#
# Stores each to-do item.
#
class ToDoItem < ApplicationRecord
  enum status: {active: "active", done: "done"}

  # validates_inclusion_of :status, in: statuses.keys, on: :create, message: "%s is not included in the list"
end
