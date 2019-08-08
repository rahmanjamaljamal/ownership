defmodule OwnershipWeb.Schema.Types.ModelType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Ownership.Repo

  object :model_type do
    field(:id, non_null(:id))
    field(:name, non_null(:string))
    field(:type, non_null(:string))
    field(:class, non_null(:string))

    field(:car, list_of(:car_type), resolve: assoc(:cars))
  end

  input_object :model_input_type do
    field(:name, non_null(:string))
    field(:type, non_null(:string))
    field(:class, non_null(:string))
  end
end
