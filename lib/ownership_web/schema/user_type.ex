defmodule OwnershipWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
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

  input_object :user_input_type do
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
end
