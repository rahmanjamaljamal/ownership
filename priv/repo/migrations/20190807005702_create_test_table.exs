defmodule Ownership.Repo.Migrations.CreateTestTable do
  use Ecto.Migration

  def change do
    create table(:test_table) do
      add :column1, :string

      timestamps()
    end

  end
end
