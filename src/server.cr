require "onyx/http"

require "./views/**"
require "./endpoints/**"

Onyx.get "/", Endpoints::Hello
Onyx.listen
