defmodule OwnershipWeb.UserResolver do
  alias Ownership.Accounts

  def all_users(_root, _args, _info) do
    {:ok, Accounts.list_users()}
  end

  def create_user(_root, %{input: input}, _info) do
    # TODO: add detailed error message handling later
    case Accounts.create_user(input) do
      {:ok, user} ->
        {:ok, user}

      _error ->
        {:error, "could not create user"}
    end
  end

  def search_user(id) do
    case Accounts.get_user!(id) do
      nil -> {:error, "user id [#{id}] not found!"}
      user -> {:ok, user}
    end
  end
end
