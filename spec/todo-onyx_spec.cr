require "./spec_helper"
require "http/client"

spawn do
  sleep(1)
  client = HTTP::Client.new(URI.parse("http://localhost:5000"))

  it do
    response = client.get("/")
    response.status_code.should eq 200
    response.body.should eq %Q[{"message":"Hello, Onyx!"}]
  end

  it do
    response = client.get("/?who=Crystal")
    response.status_code.should eq 200
    response.body.should eq %Q[{"message":"Hello, Crystal!"}]
  end

  exit
end

require "../src/server"
