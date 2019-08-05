defmodule Ownership.AutomobilesTest do
  use Ownership.DataCase

  alias Ownership.Automobiles

  describe "cars" do
    alias Ownership.Automobiles.Car

    @valid_attrs %{
      chassis: "some chassis",
      detail_id: 42,
      mileage: 42,
      model_id: 42,
      plate: "some plate",
      renavam: "some renavam",
      transmission: "some transmission",
      year: 42
    }
    @update_attrs %{
      chassis: "some updated chassis",
      detail_id: 43,
      mileage: 43,
      model_id: 43,
      plate: "some updated plate",
      renavam: "some updated renavam",
      transmission: "some updated transmission",
      year: 43
    }
    @invalid_attrs %{
      chassis: nil,
      detail_id: nil,
      mileage: nil,
      model_id: nil,
      plate: nil,
      renavam: nil,
      transmission: nil,
      year: nil
    }

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Automobiles.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Automobiles.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Automobiles.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Automobiles.create_car(@valid_attrs)
      assert car.chassis == "some chassis"
      assert car.detail_id == 42
      assert car.mileage == 42
      assert car.model_id == 42
      assert car.plate == "some plate"
      assert car.renavam == "some renavam"
      assert car.transmission == "some transmission"
      assert car.year == 42
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Automobiles.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, car} = Automobiles.update_car(car, @update_attrs)
      assert %Car{} = car
      assert car.chassis == "some updated chassis"
      assert car.detail_id == 43
      assert car.mileage == 43
      assert car.model_id == 43
      assert car.plate == "some updated plate"
      assert car.renavam == "some updated renavam"
      assert car.transmission == "some updated transmission"
      assert car.year == 43
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Automobiles.update_car(car, @invalid_attrs)
      assert car == Automobiles.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Automobiles.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Automobiles.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Automobiles.change_car(car)
    end
  end
end
