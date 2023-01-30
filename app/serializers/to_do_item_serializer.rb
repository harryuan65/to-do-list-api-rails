# frozen_string_literal: true

#
# Expose only required fields for to do items
#
class ToDoItemSerializer < Panko::Serializer
  attributes :id, :title, :status
end
