require "onyx/http"

require "./views/**"
require "./endpoints/**"

Onyx::HTTP.get "/", Endpoints::Hello
Onyx::HTTP.listen
