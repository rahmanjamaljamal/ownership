defmodule Ownership.Repo.Migrations.CreateModels do
  use Ecto.Migration

  def change do
    create table(:models) do
      add(:name, :string)
      add(:type, :string)
      add(:class, :string)

      timestamps()
    end
  end
end
