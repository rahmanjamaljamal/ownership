defmodule OwnershipWeb.Router do
  use OwnershipWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/" do
    pipe_through(:api)

    forward("/graphiql", Absinthe.Plug.GraphiQL,
      schema: OwnershipWeb.Schema,
      interface: :simple,
      context: %{pubsub: OwnershipWeb.Endpoint}
    )
  end
end
