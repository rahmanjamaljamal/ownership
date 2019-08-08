# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ownership.Repo.insert!(%Ownership.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Ownership.Accounts.User
alias Ownership.Automobiles.Model
alias Ownership.Automobiles.Detail
alias Ownership.Repo

%User{
  type: "basura",
  name: "Jameny Rahmeny",
  email: "lixo@basura.com",
  cpf: "00077788844",
  phone: "404-not-found",
  class: "lixo",
  cep: "88037-000",
  address: "Corrego",
  neighbourhood: "Zona Leste",
  city: "Floripa",
  number: 404,
  state: "SC"
}
|> Repo.insert!()

%Model{
  name: "911 GT3",
  type: "Turbo",
  class: "911"
}
|> Repo.insert!()

%Detail{
  type: "Spoiler",
  class: "Body-kit"
}
|> Repo.insert!()
