defmodule OwnershipWeb.ModelResolver do
  alias Ownership.Automobiles

  def all_models(_root, _args, _info) do
    {:ok, Automobiles.list_models()}
  end

  def create_model(_root, %{input: input}, _info) do
    # TODO: add Modeled error message handling later
    case Automobiles.create_model(input) do
      {:ok, model} ->
        {:ok, model}

      _error ->
        {:error, "could not create Model"}
    end
  end

  def search_model(id) do
    case Automobiles.get_model!(id) do
      nil -> {:error, "model id [#{id}] not found!"}
      model -> {:ok, model}
    end
  end
end
