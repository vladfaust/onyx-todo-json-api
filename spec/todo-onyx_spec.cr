require "./spec_helper"
require "http/client"

spawn do
  sleep(1)
  client = HTTP::Client.new(URI.parse("http://localhost:5000"))

  it "GET /" do
    response = client.get("/")
    response.status_code.should eq 200
    response.body.should eq %Q[{"message":"Hello, Onyx!"}]
  end

  it "GET /?who=Crystal" do
    response = client.get("/?who=Crystal")
    response.status_code.should eq 200
    response.body.should eq %Q[{"message":"Hello, Crystal!"}]
  end

  id = nil

  it "POST /items" do
    response = client.post("/items", body: {
      content: "Learn Crystal",
    }.to_json)
    response.status_code.should eq 201
    match = response.body.match(/\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/)
    match.should_not be_nil
    id = match.not_nil![1]
  end

  it "GET /items" do
    response = client.get("/items")
    response.status_code.should eq 200
    response.body.should match /\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/
  end

  it "GET /items/:id" do
    response = client.get("/items/#{id}")
    response.status_code.should eq 200
    response.body.should match /\{"id":(\d+),"completed":false,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":null\}/
  end

  it "PATCH /items/:id" do
    response = client.patch("/items/#{id}", body: {
      completed: true,
    }.to_json)
    response.status_code.should eq 200
    response.body.should match /\{"id":(\d+),"completed":true,"content":"Learn Crystal","createdAt":"(?:[\w-:]+)","updatedAt":"(?:[\w-:]+)"\}/
  end

  it "DELETE /items/:id" do
    response = client.delete("/items/#{id}", body: {
      completed: true,
    }.to_json)
    response.status_code.should eq 202
    response.body.should be_empty
  end

  exit
end

require "../src/server"
