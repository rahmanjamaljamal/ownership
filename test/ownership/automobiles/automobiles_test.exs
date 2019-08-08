defmodule Ownership.AutomobilesTest do
  use Ownership.DataCase

  alias Ownership.Automobiles

  describe "cars" do
    alias Ownership.Automobiles.Car

    @valid_attrs %{
      chassis: "some chassis",
      mileage: 42,
      plate: "some plate",
      renavam: "some renavam",
      transmission: "some transmission",
      year: 42
    }
    @update_attrs %{
      chassis: "some updated chassis",
      mileage: 43,
      plate: "some updated plate",
      renavam: "some updated renavam",
      transmission: "some updated transmission",
      year: 43
    }
    @invalid_attrs %{
      chassis: nil,
      mileage: nil,
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
      assert car.mileage == 42
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
      assert car.mileage == 43
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

  describe "models" do
    alias Ownership.Automobiles.Model

    @valid_attrs %{
      name: "some name",
      type: "some type",
      class: "some class"
    }
    @update_attrs %{
      name: "some updated name",
      type: "some updated type",
      class: "some updated class"
    }
    @invalid_attrs %{
      name: nil,
      type: nil,
      class: nil
    }

    def model_fixture(attrs \\ %{}) do
      {:ok, model} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Automobiles.create_model()

      model
    end

    test "list_models/0 returns all models" do
      model = model_fixture()
      assert Automobiles.list_model() == [model]
    end

    test "get_model!/1 returns the model with given id" do
      model = model_fixture()
      assert Automobiles.get_model!(model.id) == model
    end

    test "create_model/1 with valid data creates a model" do
      assert {:ok, %Model{} = model} = Automobiles.create_model(@valid_attrs)
      assert model.name == "some name"
      assert model.type == "some type"
      assert model.class == "some class"
    end

    test "create_model/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Automobiles.create_model(@invalid_attrs)
    end

    test "update_model/2 with valid data updates the model" do
      model = model_fixture()
      assert {:ok, model} = Automobiles.update_model(model, @update_attrs)
      assert %Model{} = model
      assert model.name == "some updated name"
      assert model.type == "some updated type"
      assert model.class == "some updated class"
    end

    test "update_model/2 with invalid data returns error changeset" do
      model = model_fixture()
      assert {:error, %Ecto.Changeset{}} = Automobiles.update_model(model, @invalid_attrs)
      assert model == Automobiles.get_model!(model.id)
    end

    test "delete_model/1 deletes the model" do
      model = model_fixture()
      assert {:ok, %Model{}} = Automobiles.delete_model(model)
      assert_raise Ecto.NoResultsError, fn -> Automobiles.get_model!(model.id) end
    end

    test "change_model/1 returns a model changeset" do
      model = model_fixture()
      assert %Ecto.Changeset{} = Automobiles.change_model(model)
    end
  end
end
