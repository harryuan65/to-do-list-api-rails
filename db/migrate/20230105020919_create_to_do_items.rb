class CreateToDoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :to_do_items do |t|
      t.string :title
      t.string :status, default: "active"

      t.timestamps
    end
  end
end
