defmodule OwnershipWeb.CarResolver do
  alias Ownership.Automobiles
  alias OwnershipWeb.{UserResolver, ModelResolver, DetailResolver}

  def all_cars(_root, _args, _info) do
    cars = Automobiles.list_cars()
    {:ok, cars}
  end

  def register_car(_root, %{input: input}, _info) do
    # TODO: add detailed error message handling later
    case UserResolver.search_user(input.user_id) do
      {:ok, user} ->
        case ModelResolver.search_model(input.model_id) do
          {:ok, model} ->
            case DetailResolver.search_detail(input.detail_id) do
              {:ok, detail} ->
                case Automobiles.create_car(user, model, detail, input) do
                  {:ok, car} -> {:ok, car}
                  _error -> {:error, "could not register car"}
                end

              _error ->
                {:error, "detail id [#{input.detail_id}] not found"}
            end

          _error ->
            {:error, "model id [#{input.model_id}] not found"}
        end

      _error ->
        {:error, "user id [#{input.user_id}] not found"}
    end
  end
end
