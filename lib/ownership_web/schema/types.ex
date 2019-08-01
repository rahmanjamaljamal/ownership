defmodule OwnershipWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias OwnershipWeb.Schema.Types

  import_types(Types.UserType)
end
