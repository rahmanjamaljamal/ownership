defmodule Ownership.Repo.Migrations.CreateDetails do
  use Ecto.Migration

  def change do
    create table(:details) do
      add(:type, :string)
      add(:class, :string)

      timestamps()
    end
  end
end
