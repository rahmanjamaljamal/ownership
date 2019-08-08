defmodule Ownership.Automobiles.Detail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "details" do
    field(:type, :string)
    field(:class, :string)

    has_many(:cars, Ownership.Automobiles.Car, foreign_key: :detail_id)

    timestamps()
  end

  @doc false
  def changeset(detail, attrs) do
    detail
    |> cast(attrs, [:type, :class])
    |> validate_required([:type, :class])
  end
end
