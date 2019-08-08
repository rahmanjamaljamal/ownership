defmodule Ownership.Automobiles.Model do
  use Ecto.Schema
  import Ecto.Changeset

  schema "models" do
    field(:name, :string)
    field(:type, :string)
    field(:class, :string)

    has_many(:cars, Ownership.Automobiles.Car, foreign_key: :model_id)

    timestamps()
  end

  @doc false
  def changeset(model, attrs) do
    model
    |> cast(attrs, [:name, :type, :class])
    |> validate_required([:name, :type, :class])
  end
end
