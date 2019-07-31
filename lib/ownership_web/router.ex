defmodule OwnershipWeb.Router do
  use OwnershipWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", OwnershipWeb do
    pipe_through(:api)
  end
end
