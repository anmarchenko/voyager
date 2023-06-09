defmodule VoyagerWeb.Resolvers.Trips do
  @moduledoc """
  Graphql resolvers for accounts context
  """
  alias Voyager.Planning.Trips, as: VoyagerTrips
  alias VoyagerWeb.Resolvers

  def create(_parent, %{input: args}, %{context: %{current_user: current_user}}) do
    args
    |> VoyagerTrips.add(current_user)
    |> Resolvers.mutation_result()
  end

  def create(_parent, _args, _resolution), do: Resolvers.not_authorized()

  def update(_parent, %{input: args, id: trip_id}, %{
        context: %{current_user: current_user}
      }) do
    with {:ok, trip} <- VoyagerTrips.get(trip_id),
         :ok <- VoyagerTrips.authorize(:update, current_user, trip) do
      trip
      |> VoyagerTrips.update(args)
      |> Resolvers.mutation_result()
    end
  end

  def update(_parent, _args, _resolution), do: Resolvers.not_authorized()

  def delete(_parent, %{id: trip_id}, %{context: %{current_user: current_user}}) do
    with {:ok, trip} <- VoyagerTrips.get(trip_id),
         :ok <- VoyagerTrips.authorize(:delete, current_user, trip) do
      trip
      |> VoyagerTrips.delete()
      |> Resolvers.mutation_result()
    end
  end

  def delete(_parent, _args, _resolution), do: Resolvers.not_authorized()
end
