defmodule Ownership.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add(:transmission, :string)
      add(:mileage, :integer)
      add(:year, :integer)
      add(:chassis, :string)
      add(:renavam, :string)
      add(:plate, :string)

      add(:user_id, references(:users, on_delete: :nothing))
      add(:model_id, references(:models, on_delete: :nothing))
      add(:detail_id, references(:details, on_delete: :nothing))

      timestamps()
    end

    create(index(:cars, [:user_id]))
    create(index(:cars, [:model_id]))
    create(index(:cars, [:detail_id]))
  end
end
