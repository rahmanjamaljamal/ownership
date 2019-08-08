defmodule OwnershipWeb.DetailResolver do
  alias Ownership.Automobiles

  def all_details(_root, _args, _info) do
    {:ok, Automobiles.list_details()}
  end

  def create_detail(_root, %{input: input}, _info) do
    # TODO: add detailed error message handling later
    case Automobiles.create_detail(input) do
      {:ok, detail} ->
        {:ok, detail}

      _error ->
        {:error, "could not create detail"}
    end
  end

  def search_detail(id) do
    case Automobiles.get_detail!(id) do
      nil -> {:error, "detail id [#{id}] not found!"}
      detail -> {:ok, detail}
    end
  end
end
