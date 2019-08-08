defmodule Ownership.Automobiles.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field(:chassis, :string)
    field(:mileage, :integer)
    field(:plate, :string)
    field(:renavam, :string)
    field(:transmission, :string)
    field(:year, :integer)

    belongs_to(:users, Ownership.Accounts.User, foreign_key: :user_id)
    belongs_to(:models, Ownership.Automobiles.Model, foreign_key: :model_id)
    belongs_to(:details, Ownership.Automobiles.Detail, foreign_key: :detail_id)

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [
      :transmission,
      :mileage,
      :year,
      :chassis,
      :renavam,
      :plate
    ])
    |> validate_required([
      :transmission,
      :mileage,
      :year,
      :chassis,
      :renavam,
      :plate
    ])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:model_id)
    |> foreign_key_constraint(:detail_id)
  end
end
