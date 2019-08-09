defmodule Ownership.Automobiles do
  @moduledoc """
  The Automobiles context.
  """

  import Ecto.Query, warn: false
  alias Ownership.Repo

  alias Ownership.Automobiles.{Car, Model, Detail}

  @doc """
  Returns the list of cars.

  ## Examples

      iex> list_cars()
      [%Car{}, ...]

  """
  def list_cars do
    Repo.all(Car)
  end

  @doc """
  Returns the list of models.

  ## Examples

      iex> list_models()
      [%Model{}, ...]

  """
  def list_models do
    Repo.all(Model)
  end

  @doc """
  Returns the list of details.

  ## Examples

      iex> list_details()
      [%Detail{}, ...]

  """
  def list_details do
    Repo.all(Detail)
  end

  @doc """
  Gets a single car.

  Raises `Ecto.NoResultsError` if the Car does not exist.

  ## Examples

      iex> get_car!(123)
      %Car{}

      iex> get_car!(456)
      ** (Ecto.NoResultsError)

  """
  def get_car!(id), do: Repo.get!(Car, id)

  @doc """
  Gets a single model.

  Raises `Ecto.NoResultsError` if the Model does not exist.

  ## Examples

      iex> get_model!(123)
      %Model{}

      iex> get_model!(456)
      ** (Ecto.NoResultsError)

  """
  def get_model!(id), do: Repo.get!(Model, id)

  @doc """
  Gets a single detail.

  Raises `Ecto.NoResultsError` if the Detail does not exist.

  ## Examples

      iex> get_detail!(123)
      %Detail{}

      iex> get_detail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_detail!(id), do: Repo.get!(Detail, id)

  @doc """
  Creates a car.

  ## Examples

      iex> create_car(%{field: value})
      {:ok, %Car{}}

      iex> create_car(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_car(user, model, detail, attrs \\ %{}) do
    # Ecto.build_assoc(user, :cars)
    %Car{user_id: user.id, model_id: model.id, detail_id: detail.id}
    |> Car.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a model.

  ## Examples

      iex> create_model(%{field: value})
      {:ok, %Model{}}

      iex> create_model(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_model(attrs \\ %{}) do
    %Model{}
    |> Model.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Creates a detail.

  ## Examples

      iex> create_detail(%{field: value})
      {:ok, %Detail{}}

      iex> create_detail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_detail(attrs \\ %{}) do
    %Detail{}
    |> Detail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a car.

  ## Examples

      iex> update_car(car, %{field: new_value})
      {:ok, %Car{}}

      iex> update_car(car, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_car(%Car{} = car, attrs) do
    car
    |> Car.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Updates a model.

  ## Examples

      iex> update_model(model, %{field: new_value})
      {:ok, %Model{}}

      iex> update_model(model, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_model(%Model{} = model, attrs) do
    model
    |> Model.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Car.

  ## Examples

      iex> delete_car(car)
      {:ok, %Car{}}

      iex> delete_car(car)
      {:error, %Ecto.Changeset{}}

  """
  def delete_car(%Car{} = car) do
    Repo.delete(car)
  end

  @doc """
  Deletes a Model.

  ## Examples

      iex> delete_model(model)
      {:ok, %Model{}}

      iex> delete_model(model)
      {:error, %Ecto.Changeset{}}

  """
  def delete_model(%Model{} = model) do
    Repo.delete(model)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking car changes.

  ## Examples

      iex> change_car(car)
      %Ecto.Changeset{source: %Car{}}

  """
  def change_car(%Car{} = car) do
    Car.changeset(car, %{})
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking model changes.

  ## Examples

      iex> change_model(model)
      %Ecto.Changeset{source: %Model{}}

  """
  def change_model(%Model{} = model) do
    Model.changeset(model, %{})
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking detail changes.

  ## Examples

      iex> change_detail(detail)
      %Ecto.Changeset{source: %Detail{}}

  """
  def change_detail(%Detail{} = detail) do
    Detail.changeset(detail, %{})
  end
end
