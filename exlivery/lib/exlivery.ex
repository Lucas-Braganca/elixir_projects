defmodule Exlivery do
  alias Exlivery.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Exlivery.Orders.CreateOrUpdate, as: CreateOrUpdateOrders
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.Agent, as: OrderAgent

  def start_agents do
    UserAgent.start_link(%{})
    OrderAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrders, as: :call
end
