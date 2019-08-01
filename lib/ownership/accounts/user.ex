defmodule Ownership.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:address, :string)
    field(:cep, :string)
    field(:city, :string)
    field(:class, :string)
    field(:cpf, :string)
    field(:email, :string, unique: true)
    field(:name, :string)
    field(:neighbourhood, :string)
    field(:number, :integer)
    field(:phone, :string)
    field(:state, :string)
    field(:type, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :type,
      :name,
      :email,
      :cpf,
      :phone,
      :class,
      :cep,
      :address,
      :neighbourhood,
      :city,
      :number,
      :state
    ])
    |> validate_required([
      :type,
      :name,
      :email,
      :cpf,
      :phone,
      :class,
      :cep,
      :address,
      :neighbourhood,
      :city,
      :number,
      :state
    ])
  end
end
