require "swagger_helper"

RSpec.describe "to_do_items", type: :request, swagger: true do
  after do |example|
    if response.body.present?
      example.metadata[:response][:content] = {
        "application/json" => {
          examples: {
            example.metadata[:example_group][:description] => {
              value: JSON.parse(response.body, symbolize_names: true)
            }
          }
        }
      }
    end
  end

  path "/to_do_items" do
    get "List to_do_items" do
      tags "ToDoItem"
      produces "application/json"

      response 200, "Successfully received list of to_do_items" do
        schema type: :array,
          items: {
            "$ref" => "#/components/schemas/to_do_item"
          }
        before do
          create_list(:to_do_item, 5)
        end

        run_test!
      end
    end

    post "Create to_do_item" do
      tags "ToDoItem"
      produces "application/json"
      consumes "application/json"

      parameter name: :payload, in: :body, required: true, description: "to_do_item fields",
        schema: {"$ref" => "#/components/schemas/to_do_item"}

      let(:to_do_item) { create(:to_do_item) }

      response 204, "Successfully created to_do_item" do
        let(:payload) { {title: "New Item!", status: "done"} }
        let(:id) { to_do_item.id }
        run_test!
      end

      response 400, "Bad Request" do
        let(:id) { to_do_item.id }
        let(:payload) { {title: "New Item!", status: "pending"} } # invalid

        run_test!
      end
    end
  end

  path "/to_do_items/{id}" do
    patch "Update to_do_item" do
      tags "ToDoItem"
      consumes "application/json"
      parameter name: :id, in: :path, type: :integer, required: true, description: "to_do_item id"
      parameter name: :payload, in: :body, schema: {"$ref" => "#/components/schemas/to_do_item"}, required: true, description: "to_do_item fields"

      let(:payload) { {title: "Updated title", status: "done"} }
      let(:to_do_item) { create(:to_do_item) }

      response 204, "Update success" do
        let(:id) { to_do_item.id }

        run_test!
      end

      response 404, "Not found" do
        let(:id) { ToDoItem.count + 1 }
        run_test!
      end
    end

    delete "Delete to_do_item" do
      tags "ToDoItem"
      parameter name: :id, in: :path, type: :integer, required: true, description: "to_do_item id"

      response 204, "Delete success" do
        let(:to_do_item) { create(:to_do_item) }
        let(:id) { to_do_item.id }

        run_test!
      end

      response 404, "Not found" do
        let(:id) { ToDoItem.count + 1 }
        run_test!
      end
    end
  end
end
