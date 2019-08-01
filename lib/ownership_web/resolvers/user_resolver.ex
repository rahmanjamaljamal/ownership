defmodule OwnershipWeb.UserResolver do
  alias Ownership.Accounts

  def all_users(_root, _args, _info) do
    users = Accounts.list_users()
    {:ok, users}
  end
end
