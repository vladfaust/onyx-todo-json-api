require "onyx/http"

require "./models"
require "./views/**"
require "./endpoints/**"

Onyx.get "/", Endpoints::Hello
Onyx.post "/items", Endpoints::Items::Create
Onyx.get "/items", Endpoints::Items::Index
Onyx.get "/items/:id", Endpoints::Items::Get
Onyx.patch "/items/:id", Endpoints::Items::Update
Onyx.delete "/items/:id", Endpoints::Items::Delete

Onyx.listen
