defmodule OwnershipWeb.Schema.Types.DetailType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Ownership.Repo

  object :detail_type do
    field(:id, non_null(:id))
    field(:type, non_null(:string))
    field(:class, non_null(:string))

    field(:car, list_of(:car_type), resolve: assoc(:cars))
  end

  input_object :detail_input_type do
    field(:type, non_null(:string))
    field(:class, non_null(:string))
  end
end
