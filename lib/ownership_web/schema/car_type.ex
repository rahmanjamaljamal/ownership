defmodule OwnershipWeb.Schema.Types.CarType do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Ownership.Repo

  object :car_type do
    field(:id, non_null(:id))
    field(:chassis, non_null(:string))
    field(:detail_id, non_null(:integer))
    field(:mileage, non_null(:integer))
    field(:model_id, non_null(:integer))
    field(:plate, non_null(:string))
    field(:renavam, non_null(:string))
    field(:transmission, non_null(:string))
    field(:year, non_null(:integer))
    # field(:user_id, non_null(:id))
    field(:user, :user_type, resolve: assoc(:users))
  end

  input_object :car_input_type do
    field(:chassis, non_null(:string))
    field(:detail_id, non_null(:integer))
    field(:mileage, non_null(:integer))
    field(:model_id, non_null(:integer))
    field(:plate, non_null(:string))
    field(:renavam, non_null(:string))
    field(:transmission, non_null(:string))
    field(:year, non_null(:integer))
    field(:user_id, non_null(:id))
  end
end
