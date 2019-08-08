defmodule OwnershipWeb.Schema.Types do
  use Absinthe.Schema.Notation
  alias OwnershipWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.CarType)
  import_types(Types.ModelType)
  import_types(Types.DetailType)
end
