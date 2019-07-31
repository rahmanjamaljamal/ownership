defmodule Ownership.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :type, :string
      add :name, :string
      add :email, :string
      add :cpf, :string
      add :phone, :string
      add :class, :string
      add :cep, :string
      add :address, :string
      add :neighbourhood, :string
      add :city, :string
      add :number, :integer
      add :state, :string

      timestamps()
    end

  end
end
