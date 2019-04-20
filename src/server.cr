require "onyx/http"

require "./models"
require "./views/**"
require "./endpoints/**"

Onyx::HTTP.get "/", Endpoints::Hello

Onyx::HTTP.on "/items" do |r|
  r.post "/", Endpoints::Items::Create
  r.get "/", Endpoints::Items::Index
  r.get "/:id", Endpoints::Items::Get
  r.patch "/:id", Endpoints::Items::Update
  r.delete "/:id", Endpoints::Items::Delete
end

Onyx::HTTP.listen
