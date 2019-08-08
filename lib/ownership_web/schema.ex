defmodule OwnershipWeb.Schema do
  use Absinthe.Schema
  alias OwnershipWeb.UserResolver
  alias OwnershipWeb.CarResolver
  alias OwnershipWeb.ModelResolver
  alias OwnershipWeb.DetailResolver

  # import types
  import_types(OwnershipWeb.Schema.Types)

  query do
    @desc "get a list of all users"
    field(:all_users, non_null(list_of(non_null(:user_type)))) do
      resolve(&UserResolver.all_users/3)
    end

    @desc "get a list of all cars"
    field(:all_cars, non_null(list_of(non_null(:car_type)))) do
      resolve(&CarResolver.all_cars/3)
    end

    @desc "get a list of all models"
    field :all_models, non_null(list_of(non_null(:model_type))) do
      resolve(&ModelResolver.all_models/3)
    end

    @desc "get a list of all details"
    field :all_details, non_null(list_of(non_null(:detail_type))) do
      resolve(&DetailResolver.all_details/3)
    end
  end

  mutation do
    @desc "register a new user"
    field :create_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&UserResolver.create_user/3)
    end

    @desc "register a new car to an existing user"
    field :create_car, type: :car_type do
      arg(:input, non_null(:car_input_type))
      resolve(&CarResolver.register_car/3)
    end

    @desc "add a new model"
    field :add_model, type: :model_type do
      arg(:input, non_null(:model_input_type))
      resolve(&ModelResolver.create_model/3)
    end

    @desc "add a new detail"
    field :add_detail, type: :detail_type do
      arg(:input, non_null(:detail_input_type))
      resolve(&DetailResolver.create_detail/3)
    end
  end
end
