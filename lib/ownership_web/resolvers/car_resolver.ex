defmodule OwnershipWeb.CarResolver do
  alias Ownership.Automobiles
  alias OwnershipWeb.UserResolver

  def all_cars(_root, _args, _info) do
    cars = Automobiles.list_cars()
    {:ok, cars}
  end

  def register_car(_root, %{input: input}, _info) do
    # TODO: add detailed error message handling later
    case UserResolver.search_user(input.user_id, _info) do
      {:ok, user} ->
        case Automobiles.create_car(user, input) do
          {:ok, car} ->
            {:ok, car}

          _error ->
            {:error, "could not register car"}
        end

      _error ->
        {:error, "user id [#{input.user_id}] not found"}
    end
  end
end
