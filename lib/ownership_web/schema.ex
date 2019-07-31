defmodule OwnershipWeb.Schema do
  use Absinthe.Schema
  alias OwnershipWeb.UserResolver

  object :user do
    field(:id, non_null(:id))
    field(:address, non_null(:string))
    field(:cep, non_null(:string))
    field(:city, non_null(:string))
    field(:class, non_null(:string))
    field(:cpf, non_null(:string))
    field(:email, non_null(:string))
    field(:name, non_null(:string))
    field(:neighbourhood, non_null(:string))
    field(:number, non_null(:integer))
    field(:phone, non_null(:string))
    field(:state, non_null(:string))
    field(:type, non_null(:string))
  end

  query do
    field(:all_users, non_null(list_of(non_null(:user)))) do
      resolve(&UserResolver.all_users/3)
    end
  end
end
