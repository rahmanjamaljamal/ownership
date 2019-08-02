defmodule Ownership.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :model_id, :integer
      add :detail_id, :integer
      add :transmission, :string
      add :mileage, :integer
      add :year, :integer
      add :chassis, :string
      add :renavam, :string
      add :plate, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:cars, [:user_id])
  end
end
