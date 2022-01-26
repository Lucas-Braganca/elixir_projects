defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory do
    %User{
      address: "Rua Teste",
      age: 29,
      cpf: "12345678900",
      email: "lucas@email.com",
      name: "Lucas"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Pizza de peperoni",
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua Teste",
      items: [
        %Exlivery.Orders.Item{
          category: :pizza,
          description: "Pizza de peperoni",
          quantity: 1,
          unity_price: Decimal.new("35.5")
        },
        %Exlivery.Orders.Item{
          category: :japonesa,
          description: "Temaki de atum",
          quantity: 2,
          unity_price: Decimal.new("20.50")
        }
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
