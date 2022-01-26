defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.{Order, Item}
  import Exlivery.Factory

  describe("save/1") do
    test "saves the order" do
      order = build(:order)
      OrderAgent.start_link(%{})
      {:ok, _uuid} = assert OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    test "when the order is found, returns the order" do
      {:ok, uuid} =
        :order
        |> build()
        |> OrderAgent.save()

      response = OrderAgent.get(uuid)

      expected_response =
        {:ok,
         %Order{
           delivery_address: "Rua Teste",
           items: [
             %Item{
               category: :pizza,
               description: "Pizza de peperoni",
               quantity: 1,
               unity_price: Decimal.new("35.5")
             },
             %Item{
               category: :japonesa,
               description: "Temaki de atum",
               quantity: 2,
               unity_price: Decimal.new("20.50")
             }
           ],
           total_price: Decimal.new("76.50"),
           user_cpf: "12345678900"
         }}

      assert response == expected_response
    end

    test "when the order is not found, returns an error" do
      response = OrderAgent.get("banana")
      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
