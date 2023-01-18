#
# Allow CORS
#
class AccessAllow
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    headers = response[1]
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "POST, GET, PUT, PATCH, DELETE, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email"
    response
  end
end

ToDoListRails::Application.configure do
  config.middleware.use AccessAllow
end
