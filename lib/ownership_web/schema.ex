defmodule OwnershipWeb.Schema do
  use Absinthe.Schema
  alias OwnershipWeb.UserResolver

  # import types
  import_types(OwnershipWeb.Schema.Types)

  query do
    @desc "get a list of all users"
    field(:all_users, non_null(list_of(non_null(:user_type)))) do
      resolve(&UserResolver.all_users/3)
    end
  end

  mutation do
    @desc "register a new user"
    field :create_user, type: :user_type do
      resolve(&UserResolver.create_user/3)
    end
  end
end
