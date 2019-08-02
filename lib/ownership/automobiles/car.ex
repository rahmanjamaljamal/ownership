defmodule Ownership.Automobiles.Car do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cars" do
    field(:chassis, :string)
    field(:detail_id, :integer)
    field(:mileage, :integer)
    field(:model_id, :integer)
    field(:plate, :string)
    field(:renavam, :string)
    field(:transmission, :string)
    field(:year, :integer)
    field(:user_id, :id)

    belongs_to(:users, Ownership.Accounts.User)

    timestamps()
  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [
      :model_id,
      :detail_id,
      :transmission,
      :mileage,
      :year,
      :chassis,
      :renavam,
      :plate
    ])
    |> validate_required([
      :model_id,
      :detail_id,
      :transmission,
      :mileage,
      :year,
      :chassis,
      :renavam,
      :plate
    ])
  end
end
