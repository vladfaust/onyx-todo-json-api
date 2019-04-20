require "spec"
require "onyx/http/spec"
require "../src/server"

it "GET /" do
  response = Onyx::HTTP::Spec.get("/")
  response.assert(200, %Q[{"message":"Hello, Onyx!"}])
end

it "GET /?who=Crystal" do
  response = Onyx::HTTP::Spec.get("/?who=Crystal")
  response.assert(200, %Q[{"message":"Hello, Crystal!"}])
end

id = nil

it "POST /items" do
  response = Onyx::HTTP::Spec.post("/items", body: {
    content: "Learn Crystal",
  }.to_json)
  response.assert(201)
  match = response.body.match(/\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/)
  match.should_not be_nil
  id = match.not_nil![1]
end

it "GET /items" do
  response = Onyx::HTTP::Spec.get("/items")
  response.status_code.should eq 200
  response.body.should match /\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/
end

it "GET /items/:id" do
  response = Onyx::HTTP::Spec.get("/items/#{id}")
  response.status_code.should eq 200
  response.body.should match /\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/
end

it "PATCH /items/:id" do
  response = Onyx::HTTP::Spec.patch("/items/#{id}", body: {
    completed: true,
  }.to_json)
  response.status_code.should eq 200
  response.body.should match /\{"id":(\d+),"completed":true,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":"(?:[\w-:]+)"\}/
end

it "DELETE /items/:id" do
  response = Onyx::HTTP::Spec.delete("/items/#{id}", body: {
    completed: true,
  }.to_json)
  response.status_code.should eq 202
  response.body.should be_empty
end
