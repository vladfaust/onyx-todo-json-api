require "spec"
require "onyx/http/spec"
require "../src/server"

describe "app" do
  it "responds to /" do
    response = Onyx::HTTP::Spec.get("/")
    response.assert(200, %Q[{"message":"Hello, Onyx!"}])
  end

  it "responds to /?who" do
    response = Onyx::HTTP::Spec.get("/?who=Crystal")
    response.assert(200, %Q[{"message":"Hello, Crystal!"}])
  end
end
