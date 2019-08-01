defmodule Ownership.AccountsTest do
  use Ownership.DataCase

  alias Ownership.Accounts

  describe "users" do
    alias Ownership.Accounts.User

    @valid_attrs %{
      address: "some address",
      cep: "some cep",
      city: "some city",
      class: "some class",
      cpf: "some cpf",
      email: "some email",
      name: "some name",
      neighbourhood: "some neighbourhood",
      number: 42,
      phone: "some phone",
      state: "some state",
      type: "some type"
    }
    @update_attrs %{
      address: "some updated address",
      cep: "some updated cep",
      city: "some updated city",
      class: "some updated class",
      cpf: "some updated cpf",
      email: "some updated email",
      name: "some updated name",
      neighbourhood: "some updated neighbourhood",
      number: 43,
      phone: "some updated phone",
      state: "some updated state",
      type: "some updated type"
    }
    @invalid_attrs %{
      address: nil,
      cep: nil,
      city: nil,
      class: nil,
      cpf: nil,
      email: nil,
      name: nil,
      neighbourhood: nil,
      number: nil,
      phone: nil,
      state: nil,
      type: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.address == "some address"
      assert user.cep == "some cep"
      assert user.city == "some city"
      assert user.class == "some class"
      assert user.cpf == "some cpf"
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.neighbourhood == "some neighbourhood"
      assert user.number == 42
      assert user.phone == "some phone"
      assert user.state == "some state"
      assert user.type == "some type"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.address == "some updated address"
      assert user.cep == "some updated cep"
      assert user.city == "some updated city"
      assert user.class == "some updated class"
      assert user.cpf == "some updated cpf"
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.neighbourhood == "some updated neighbourhood"
      assert user.number == 43
      assert user.phone == "some updated phone"
      assert user.state == "some updated state"
      assert user.type == "some updated type"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
